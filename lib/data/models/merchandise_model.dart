
import 'package:json_annotation/json_annotation.dart';

part 'merchandise_model.g.dart';

@JsonSerializable()
class MerchantModel {
  final String name;
  final String image;
  final String scheme;
  MerchantModel({required this.name, required this.image, required this.scheme});

  factory MerchantModel.fromJson(Map<String, dynamic> json) => _$MerchantModelFromJson(json);

}
