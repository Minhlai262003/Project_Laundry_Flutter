import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/history_service_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class CreateLaundryServiceUsecase {
  final HistoryServiceRepository _historyServiceRepository;
  CreateLaundryServiceUsecase(this._historyServiceRepository);

  Future<String?> execute(ServiceRegisted service) {
    return _historyServiceRepository.createService(service);
  }
}
