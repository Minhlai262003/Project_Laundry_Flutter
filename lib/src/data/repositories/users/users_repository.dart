import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/users/users_firebase_datasource.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';

abstract class UsersRepository {
  Future<User?> fetchUserData(String idUser);
}

@Service(exposeAs: UsersRepository)
class UsersRepositoryImpl implements UsersRepository {
  final UsersFirebaseDatasource _userFirebaseDatasource;
  UsersRepositoryImpl(this._userFirebaseDatasource);
  @override
  Future<User?> fetchUserData(String idUser) {
    return _userFirebaseDatasource.fetchUserData(idUser);
  }
}
