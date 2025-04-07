import 'package:json_annotation/json_annotation.dart';

part 'banner_laundry_service.g.dart';

@JsonSerializable()
class BannerLaundryService {
  final String bannerId;
  final String src;

  BannerLaundryService({required this.bannerId, required this.src});

  factory BannerLaundryService.fromJson(Map<String, dynamic> json) {
    return _$BannerLaundryServiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BannerLaundryServiceToJson(this);
}
