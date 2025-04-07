// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_registed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServiceRegisted _$ServiceRegistedFromJson(Map<String, dynamic> json) =>
    ServiceRegisted(
      serviceId: json['serviceId'] as String?,
      service: LaundryService.fromJson(json['service'] as Map<String, dynamic>),
      userId: json['userId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      listImages: (json['listImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      note: json['note'] as String,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$ServiceRegistedToJson(ServiceRegisted instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'service': instance.service.toJson(),
      'userId': instance.userId,
      'quantity': instance.quantity,
      'listImages': instance.listImages,
      'note': instance.note,
      'createdDate': instance.createdDate.toIso8601String(),
    };
