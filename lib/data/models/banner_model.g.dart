// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
  image: json['image'] as String,
  title: json['title'] as String,
  scheme: json['scheme'] as String,
);

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'scheme': instance.scheme,
    };
