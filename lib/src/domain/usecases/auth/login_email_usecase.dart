import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class LoginEmailUsecase {
  final AuthRepository _authRepository;
  LoginEmailUsecase(this._authRepository);

  Future<String?> execute(String email, String passWord) async {
    return _authRepository.loginEmail(email, passWord);
  }
}
