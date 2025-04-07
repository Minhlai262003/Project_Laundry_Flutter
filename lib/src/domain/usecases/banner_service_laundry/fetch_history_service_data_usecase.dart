import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/history_service_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class FetchHistoryServiceDataUsecase {
  final HistoryServiceRepository _historyServiceRepository;
  FetchHistoryServiceDataUsecase(this._historyServiceRepository);

  Future<List<ServiceRegisted>?> execute(String userId) {
    return _historyServiceRepository
        .fetchHistoryServiceData(userId)
        .then((services) {
      // Sắp xếp các dịch vụ theo createdDate giảm dần
      services?.sort((a, b) => b.createdDate.compareTo(a.createdDate));
      return services;
    });
  }
}
