import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/repositories/auth/auth_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class LogoutUsecase {
  final AuthRepository _authRepository;
  LogoutUsecase(this._authRepository);

  Future<void> execute() async {
    _authRepository.logout();
  }
}
