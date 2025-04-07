import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  String uid;
  String userName;
  String email;
  String passWord;
  String avatar;

  User(
      {required this.uid,
      required this.userName,
      required this.email,
      this.passWord = "",
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) {
    return _$UserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserToJson(this);

  // for GAF (GenericArgumentFactories)
  static User fromJsonModel(Object? json) =>
      User.fromJson(json as Map<String, dynamic>);
  static Map<String, dynamic> toJsonModel(User res) => res.toJson();
}
