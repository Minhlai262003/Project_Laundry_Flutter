import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';
import 'package:project_laundry_flutter/src/data/repositories/users/users_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class FetchUserDataUsecase {
  final UsersRepository _usersRepository;
  FetchUserDataUsecase(this._usersRepository);

  Future<User?> execute(String idUser) {
    return _usersRepository.fetchUserData(idUser);
  }
}
