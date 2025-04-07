import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';

abstract class LaundryServiceFirebaseDatasource {
  Future<List<LaundryService>?> fetchLaundryServiceData();
}

@Service(
  exposeAs: LaundryServiceFirebaseDatasource,
)
class LaundryServiceFirebaseDatasourceImpl
    implements LaundryServiceFirebaseDatasource {
  final FirebaseFirestore _firestore;
  LaundryServiceFirebaseDatasourceImpl(this._firestore);
  @override
  Future<List<LaundryService>?> fetchLaundryServiceData() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('LaundryService').get();

      List<LaundryService> listLaundryService = snapshot.docs.map((doc) {
        return LaundryService.fromJson(doc.data());
      }).toList();
      return listLaundryService;
    } catch (e) {
      print("eee" + e.toString());
      return null;
    }
  }
}
