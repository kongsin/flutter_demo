
import 'package:json_annotation/json_annotation.dart';

part 'merchandise_model.g.dart';

@JsonSerializable()
class MerchantModel {
  final String name;
  final String image;
  MerchantModel({required this.name, required this.image});

  factory MerchantModel.fromJson(Map<String, dynamic> json) => _$MerchantModelFromJson(json);

}
