import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart' as model;

abstract class AuthFirebaseDatasource {
  Future<String?> loginEmail(String email, String password);
  Future<String?> registerEmail(String email, String password, String userName);
  Future<String?> loginGoogle();
  Future<String?> loginGithub(BuildContext context);
  Future<String?> loginFacebook();
  Future<void> logout();
}

@Service(exposeAs: AuthFirebaseDatasource)
class AuthFirebaseDatasourceImpl implements AuthFirebaseDatasource {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final FacebookAuth _facebookAuth;
  final GoogleSignIn _googleSignIn;
  final GithubSignInParams _githubSignInParams;

  AuthFirebaseDatasourceImpl(
    this._auth,
    this._firestore,
    this._facebookAuth,
    this._googleSignIn,
    this._githubSignInParams,
  );

  @override
  Future<String?> loginEmail(String email, String password) async {
    try {
      final UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;
      return firebaseUser?.uid;
    } catch (e) {
      print("Error logging in with email: $e");
      return null;
    }
  }

  @override
  Future<String?> loginFacebook() async {
    try {
      final LoginResult loginResult = await _facebookAuth.login();

      if (loginResult.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        final UserCredential userCredential =
            await _auth.signInWithCredential(facebookAuthCredential);
        final firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          await _saveUserToFirestore(firebaseUser);
          return firebaseUser.uid;
        }
      }
    } catch (e) {
      print("Error logging in with Facebook: $e");
    }
    return null;
  }

  @override
  Future<String?> loginGithub(BuildContext context) async {
    try {
      final githubSignInResponse = await Navigator.of(context).push(
        MaterialPageRoute(
          builder: (builder) => GithubSigninScreen(
            params: _githubSignInParams,
            headerColor: Colors.green,
            title: 'Login with GitHub',
          ),
        ),
      ) as GithubSignInResponse?;
      print(githubSignInResponse);
      if (githubSignInResponse?.accessToken != null) {
        final credential =
            GithubAuthProvider.credential(githubSignInResponse!.accessToken!);
        final userCredential = await _auth.signInWithCredential(credential);
        final firebaseUser = userCredential.user;

        if (firebaseUser != null) {
          await _saveUserToFirestore(firebaseUser);
          return firebaseUser.uid;
        }
      }
    } catch (e) {
      print("Error logging in with GitHub: $e");
    }
    return null;
  }

  @override
  Future<String?> loginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        await _auth.signInWithCredential(credential);
        final firebaseUser = _auth.currentUser;

        if (firebaseUser != null) {
          await _saveUserToFirestore(firebaseUser);
          return firebaseUser.uid;
        }
      }
    } catch (e) {
      print("Error logging in with Google: $e");
    }
    return null;
  }

  @override
  Future<String?> registerEmail(
      String email, String password, String userName) async {
    try {
      final UserCredential credential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = credential.user;

      if (firebaseUser != null) {
        await _saveUserToFirestore(firebaseUser, userName: userName);
        return firebaseUser.uid;
      }
    } catch (e) {
      print("Error registering with email: $e");
    }
    return null;
  }

  @override
  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await _facebookAuth.logOut();
      await _auth.signOut();
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  // Helper method to save user to Firestore
  Future<void> _saveUserToFirestore(User firebaseUser,
      {String? userName}) async {
    final user = model.User(
      uid: firebaseUser.uid,
      userName: userName ?? firebaseUser.displayName ?? "",
      email: firebaseUser.email ?? "",
      avatar: firebaseUser.photoURL ?? "",
    );

    await _firestore
        .collection("Users")
        .doc(firebaseUser.uid)
        .set(user.toJson());
  }
}
