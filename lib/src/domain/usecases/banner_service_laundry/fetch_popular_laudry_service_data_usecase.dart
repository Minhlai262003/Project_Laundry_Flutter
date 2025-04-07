import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/laundry_service_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class FetchPopularLaudryServiceDataUsecase {
  final LaundryServiceRepository _laundryServiceRepository;
  FetchPopularLaudryServiceDataUsecase(this._laundryServiceRepository);

  Future<List<LaundryService>?> execute() async {
    List<LaundryService>? items =
        await _laundryServiceRepository.fetchLaundryServiceData();
    //Get items have rating >= 4.0;
    if (items != null) {
      List<LaundryService> listItems =
          items.where((item) => item.rating >= 4.0).toList();
      // Sắp xếp giảm dần theo rating
      listItems.sort(
        (a, b) => b.rating.compareTo(a.rating),
      );
      return listItems;
    }
    return null;
  }
}
