import 'package:catalyst_builder/catalyst_builder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_laundry_flutter/src/data/models/user.dart';

abstract class UsersFirebaseDatasource {
  Future<User?> fetchUserData(String idUser);
}

@Service(
  exposeAs: UsersFirebaseDatasource,
)
class UserFirebaseDatasourceImpl implements UsersFirebaseDatasource {
  final FirebaseFirestore _firestore;
  UserFirebaseDatasourceImpl(this._firestore);
  @override
  Future<User?> fetchUserData(String idUser) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection('Users').doc(idUser).get();

      if (snapshot.exists) {
        return User.fromJson(snapshot.data() as Map<String, dynamic>);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return null;
    }
  }
}
