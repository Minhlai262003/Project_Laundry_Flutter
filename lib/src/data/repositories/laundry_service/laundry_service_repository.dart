import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:project_laundry_flutter/src/data/datasources/firebase_datasource/laundry_service/laundry_service_firebase_datasource.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';

abstract class LaundryServiceRepository {
  Future<List<LaundryService>?> fetchLaundryServiceData();
}

@Service(
  exposeAs: LaundryServiceRepository,
)
class LaundryServiceRepositoryImpl implements LaundryServiceRepository {
  final LaundryServiceFirebaseDatasource _laundryServiceFirebaseDatasource;
  LaundryServiceRepositoryImpl(this._laundryServiceFirebaseDatasource);

  @override
  Future<List<LaundryService>?> fetchLaundryServiceData() {
    return _laundryServiceFirebaseDatasource.fetchLaundryServiceData();
  }
}
