// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendModel _$RecommendModelFromJson(Map<String, dynamic> json) =>
    RecommendModel(
      image: json['image'] as String,
      title: json['title'] as String,
      scheme: json['scheme'] as String,
    );

Map<String, dynamic> _$RecommendModelToJson(RecommendModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'scheme': instance.scheme,
    };
