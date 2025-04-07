import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UserManager {
  Future<void> addIdUser(String idUser);
  Future<String?> getIdUser();
  Future<String?> removeIdUser();
}

@Service(exposeAs: UserManager, lifetime: ServiceLifetime.singleton)
class UserManagerImpl implements UserManager {
  // final _prefs = SharedPreferences.getInstance();

  @override
  Future<void> addIdUser(String idUser) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('idUser', idUser);
  }

  @override
  Future<String?> getIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    String idUser = prefs.getString('idUser') ?? '';
    if (idUser == '') {
      return null;
    }
    return idUser;
  }

  @override
  Future<String?> removeIdUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('idUser');
    return null;
  }
}
