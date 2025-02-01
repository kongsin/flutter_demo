// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      image: json['image'] as String,
      name: json['name'] as String,
      scheme: json['scheme'] as String,
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'scheme': instance.scheme,
    };
