import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/laundry_service_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class FetchLaudryServiceDataUsecase {
  final LaundryServiceRepository _laundryServiceRepository;
  FetchLaudryServiceDataUsecase(this._laundryServiceRepository);

  Future<List<LaundryService>?> execute() {
    return _laundryServiceRepository.fetchLaundryServiceData();
  }
}
