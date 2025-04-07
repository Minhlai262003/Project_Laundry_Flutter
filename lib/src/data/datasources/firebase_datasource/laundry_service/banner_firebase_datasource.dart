import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_laundry_flutter/src/data/models/banner_laundry_service.dart';

abstract class BannerFirebaseDatasource {
  Future<List<BannerLaundryService>?> fetchBannerServiceData();
}

@Service(exposeAs: BannerFirebaseDatasource)
class BannerFirebaseDatasourceImpl implements BannerFirebaseDatasource {
  final FirebaseFirestore _firestore;
  BannerFirebaseDatasourceImpl(this._firestore);
  @override
  Future<List<BannerLaundryService>?> fetchBannerServiceData() async {
    try {
      // Truy vấn Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('Banner').get();

      List<BannerLaundryService> listBanners = snapshot.docs.map((doc) {
        return BannerLaundryService.fromJson(doc.data());
      }).toList();
      return listBanners;
    } catch (e) {
      print("Lỗi khi lấy dữ liệu banner: $e");
      return null;
    }
  }
}
