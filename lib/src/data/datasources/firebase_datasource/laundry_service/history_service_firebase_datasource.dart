import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_laundry_flutter/src/data/models/service_registed.dart';

abstract class HistoryServiceFirebaseDatasource {
  Future<String> createService(ServiceRegisted service);
  Future<List<ServiceRegisted>?> fetchHistoryServiceData(String userId);
}

@Service(exposeAs: HistoryServiceFirebaseDatasource)
class HistoryServiceFirebaseDatasourceImpl
    implements HistoryServiceFirebaseDatasource {
  final FirebaseFirestore _firestore;
  HistoryServiceFirebaseDatasourceImpl(this._firestore);
  @override
  Future<String> createService(ServiceRegisted service) async {
    String serviceId = _firestore
        .collection("Users")
        .doc(service.userId)
        .collection('HistoryService')
        .doc()
        .id; // Tạo ID duy nhất

    await _firestore
        .collection("Users")
        .doc(service.userId)
        .collection('HistoryService')
        .doc(serviceId)
        .set({
      ...service.toJson(),
      'serviceId': serviceId, // Thêm ID vào dữ liệu nếu cần
    });

    return serviceId; // Trả về ID vừa tạo
  }

  @override
  Future<List<ServiceRegisted>?> fetchHistoryServiceData(String userId) async {
    try {
      // Truy vấn tất cả các documents trong collection 'HistoryService'
      QuerySnapshot querySnapshot = await _firestore
          .collection("Users")
          .doc(userId)
          .collection('HistoryService')
          .get();

      // Chuyển đổi từng document snapshot thành đối tượng `ServiceRegisted`
      List<ServiceRegisted> services = querySnapshot.docs.map((doc) {
        return ServiceRegisted.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return services; // Trả về danh sách các service
    } catch (e) {
      print("hehe: $e");
      return null;
    }
  }
}
