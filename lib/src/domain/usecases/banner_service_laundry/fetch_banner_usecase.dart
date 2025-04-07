import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/models/banner_laundry_service.dart';
import 'package:project_laundry_flutter/src/data/repositories/laundry_service/banner_repository.dart';

@Service(lifetime: ServiceLifetime.transient)
class FetchBannerUsecase {
  final BannerRepository _bannerRepository;
  FetchBannerUsecase(this._bannerRepository);
  Future<List<BannerLaundryService>?> execute() {
    return _bannerRepository.fetchBannerServiceData();
  }
}
