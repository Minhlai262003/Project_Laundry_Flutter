import 'package:json_annotation/json_annotation.dart';
import 'package:project_laundry_flutter/src/data/models/laundry_service.dart';
part 'service_registed.g.dart';

@JsonSerializable(explicitToJson: true)
class ServiceRegisted {
  final String? serviceId;
  final LaundryService service;
  final String userId;
  final int quantity;
  final List<String> listImages;
  final String note;
  final DateTime createdDate;

  ServiceRegisted(
      {required this.serviceId,
      required this.service,
      required this.userId,
      required this.quantity,
      required this.listImages,
      required this.note,
      required this.createdDate});

  factory ServiceRegisted.fromJson(Map<String, dynamic> json) {
    return _$ServiceRegistedFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceRegistedToJson(this);
}
