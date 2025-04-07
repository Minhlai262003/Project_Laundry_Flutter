import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IdServiceManager {
  Future<void> addIdService(int id);
  Future<int> getIdService();
}

@Service(exposeAs: IdServiceManager, lifetime: ServiceLifetime.singleton)
class IdServiceManagerImpl implements IdServiceManager {
  // final _prefs = SharedPreferences.getInstance();

  @override
  Future<void> addIdService(int id) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('id_service', id.toString());
  }

  @override
  Future<int> getIdService() async {
    final prefs = await SharedPreferences.getInstance();
    String idService = prefs.getString('id_service') ?? "";

    return int.parse(idService);
  }
}
