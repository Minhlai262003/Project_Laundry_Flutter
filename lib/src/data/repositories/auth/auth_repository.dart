import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/auth/auth_firebase_datasource.dart';

abstract class AuthRepository {
  Future<String?> loginEmail(String email, String password);
  Future<String?> registerEmail(String email, String password, String userName);
  Future<String?> loginGoogle();
  Future<String?> loginGithub(BuildContext context);
  Future<String?> loginFacebook();
  Future<void> logout();
}

@Service(
  exposeAs: AuthRepository,
)
class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseDatasource _authFirebaseDatasource;
  AuthRepositoryImpl(this._authFirebaseDatasource);
  @override
  Future<String?> loginEmail(String email, String password) {
    return _authFirebaseDatasource.loginEmail(email, password);
  }

  @override
  Future<String?> loginFacebook() {
    return _authFirebaseDatasource.loginFacebook();
  }

  @override
  Future<String?> loginGithub(BuildContext context) {
    return _authFirebaseDatasource.loginGithub(context);
  }

  @override
  Future<String?> loginGoogle() {
    return _authFirebaseDatasource.loginGoogle();
  }

  @override
  Future<void> logout() async {
    _authFirebaseDatasource.logout();
  }

  @override
  Future<String?> registerEmail(
      String email, String password, String userName) {
    return _authFirebaseDatasource.registerEmail(email, password, userName);
  }
}
