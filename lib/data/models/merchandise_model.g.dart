// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchandise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MerchantModel _$MerchantModelFromJson(Map<String, dynamic> json) =>
    MerchantModel(
      name: json['name'] as String,
      image: json['image'] as String,
      scheme: json['scheme'] as String,
    );

Map<String, dynamic> _$MerchantModelToJson(MerchantModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'scheme': instance.scheme,
    };
