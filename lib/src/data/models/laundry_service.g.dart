// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laundry_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaundryService _$LaundryServiceFromJson(Map<String, dynamic> json) =>
    LaundryService(
      laundryServiceId: json['laundryServiceId'] as String,
      urlIcon: json['urlIcon'] as String,
      nameService: json['nameService'] as String,
      costs: (json['costs'] as num).toDouble(),
      serviceInfo: json['serviceInfo'] as String,
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$LaundryServiceToJson(LaundryService instance) =>
    <String, dynamic>{
      'laundryServiceId': instance.laundryServiceId,
      'urlIcon': instance.urlIcon,
      'nameService': instance.nameService,
      'costs': instance.costs,
      'serviceInfo': instance.serviceInfo,
      'rating': instance.rating,
    };
