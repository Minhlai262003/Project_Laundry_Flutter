import 'package:json_annotation/json_annotation.dart';
part 'laundry_service.g.dart';

@JsonSerializable()
class LaundryService {
  final String laundryServiceId;
  final String urlIcon;
  final String nameService;
  final double costs;
  final String serviceInfo;
  final double rating;

  LaundryService(
      {required this.laundryServiceId,
      required this.urlIcon,
      required this.nameService,
      required this.costs,
      required this.serviceInfo,
      this.rating = 0});

  factory LaundryService.fromJson(Map<String, dynamic> json) {
    return _$LaundryServiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$LaundryServiceToJson(this);
}
