import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class RegisterEmailUsecase {
  final AuthRepository _authRepository;
  RegisterEmailUsecase(this._authRepository);

  Future execute(String email, String password, String username) {
    return _authRepository.registerEmail(email, password, username);
  }
}
