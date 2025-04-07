import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/banner_firebase_datasource.dart';
import 'package:project_laundry_flutter/src/data/models/banner_laundry_service.dart';

abstract class BannerRepository {
  Future<List<BannerLaundryService>?> fetchBannerServiceData();
}

@Service(exposeAs: BannerRepository)
class BannerRepositoryImpl implements BannerRepository {
  final BannerFirebaseDatasource _bannerFirebaseDatasource;
  BannerRepositoryImpl(this._bannerFirebaseDatasource);
  @override
  Future<List<BannerLaundryService>?> fetchBannerServiceData() {
    return _bannerFirebaseDatasource.fetchBannerServiceData();
  }
}
