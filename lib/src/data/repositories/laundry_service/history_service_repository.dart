import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/history_service_firebase_datasource.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';

abstract class HistoryServiceRepository {
  Future<String?> createService(ServiceRegisted service);
  Future<List<ServiceRegisted>?> fetchHistoryServiceData(String userId);
}

@Service(
  exposeAs: HistoryServiceRepository,
)
class HistoryServiceRepositoryImpl implements HistoryServiceRepository {
  final HistoryServiceFirebaseDatasource _historyDatasource;
  HistoryServiceRepositoryImpl(this._historyDatasource);
  @override
  Future<String?> createService(ServiceRegisted service) {
    return _historyDatasource.createService(service);
  }

  @override
  Future<List<ServiceRegisted>?> fetchHistoryServiceData(String userId) {
    return _historyDatasource.fetchHistoryServiceData(userId);
  }
}
