import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:flutter/material.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class LoginGithubUsecase {
  final AuthRepository _authRepository;
  LoginGithubUsecase(this._authRepository);

  Future<String?> execute(BuildContext context) {
    return _authRepository.loginGithub(context);
  }
}
