import 'dart:async';

import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_email_usecase.dart';
import 'package:project_laundry_flutter/src/domain/manager/user_manager.dart';
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_facebook_usercase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_github_usecase.dart';
import 'package:project_laundry_flutter/src/domain/usecases/auth/login_google_usecase.dart';

@Service(lifetime: ServiceLifetime.transient)
class LoginBloc {
  final LoginEmailUsecase _loginEmailUseCase;
  final UserManager _userManager;
  final LoginGoogleUsecase _loginGoogleUsecase;
  final LoginGithubUsecase _loginGithubUsecase;
  final LoginFacebookUsercase _loginFacebookUsercase;

  LoginBloc(
      this._loginEmailUseCase,
      this._userManager,
      this._loginGoogleUsecase,
      this._loginGithubUsecase,
      this._loginFacebookUsercase);

  final _loginUserStreamController = StreamController<User?>();
  Stream<User?> get loginUserStream => _loginUserStreamController.stream;

  Future<String?> loginEmail(String email, String passWord) {
    return _loginEmailUseCase.execute(email, passWord);
  }

  Future<void> addIdUser(String idUser) async {
    await _userManager.addIdUser(idUser);
    print("add completed");
  }

  Future<String?> loginWithGoogle() {
    return _loginGoogleUsecase.execute();
  }

  Future<String?> loginWithFacebook() {
    return _loginFacebookUsercase.execute();
  }

  Future<String?> loginWithGithub(BuildContext context) {
    return _loginGithubUsecase.execute(context);
  }
}
