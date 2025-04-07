import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class LoginFacebookUsercase {
  final AuthRepository _authRepository;
  LoginFacebookUsercase(this._authRepository);

  Future<String?> execute() {
    return _authRepository.loginFacebook();
  }
}
