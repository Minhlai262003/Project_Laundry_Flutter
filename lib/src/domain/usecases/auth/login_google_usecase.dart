import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class LoginGoogleUsecase {
  final AuthRepository _authRepository;
  LoginGoogleUsecase(this._authRepository);

  Future<String?> execute() {
    return _authRepository.loginGoogle();
  }
}
