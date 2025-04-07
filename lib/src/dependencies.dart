import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:github_signin_promax/github_signin_promax.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:project_laundry_flutter/src/dependencies.catalyst_builder.g.dart';

DefaultServiceProvider? catalystProvider;

@GenerateServiceProvider()
void initDependencies() {
  catalystProvider = DefaultServiceProvider();
  catalystProvider?.boot();
  if (catalystProvider == null) {
    return;
  }
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  FacebookAuth facebookAuth = FacebookAuth.instance;
  GithubSignInParams githubSignInParams = GithubSignInParams(
      clientId: 'Ov23licZ2iXLKBFwLBhi',
      clientSecret: 'b46d5fdf566dda1bef960ae62d98b51692b4443e',
      redirectUrl: 'https://laundry-60f78.firebaseapp.com/__/auth/handler',
      scopes: 'read:user,user:email');
  catalystProvider?.register((p) => firebaseAuth);
  catalystProvider?.register((p) => googleSignIn);
  catalystProvider?.register((p) => facebookAuth);
  catalystProvider?.register((p) => githubSignInParams);
  catalystProvider?.register((p) => firebaseAuth);
  catalystProvider?.register((p) => fireStore);
  catalystProvider?.register((p) => googleSignIn);
}

DefaultServiceProvider getServiceProvider() {
  if (catalystProvider == null) {
    throw Exception("Have you call initCliveDJ?");
  } else {
    return catalystProvider!;
  }
}
