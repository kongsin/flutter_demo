import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';
@JsonSerializable()
class CategoryModel {

  final String image;
  final String name;
  final String scheme;

  CategoryModel({required this.image, required this.name, required this.scheme});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

}