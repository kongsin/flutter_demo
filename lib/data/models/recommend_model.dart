import 'package:json_annotation/json_annotation.dart';

part 'recommend_model.g.dart';

@JsonSerializable()
class RecommendModel {

  final String image;
  final String title;
  final String scheme;

  RecommendModel({required this.image, required this.title, required this.scheme});

  factory RecommendModel.fromJson(Map<String, dynamic> json) => _$RecommendModelFromJson(json);

}