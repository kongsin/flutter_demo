import 'package:json_annotation/json_annotation.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {

  final String image;
  final String title;
  final String scheme;

  BannerModel({required this.image, required this.title, required this.scheme});

  factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

}