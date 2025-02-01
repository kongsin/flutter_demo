import 'dart:collection';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel {
  final String name;
  final String image;

  UserModel({required this.name, required this.image});

  factory UserModel.fromJson(HashMap<String, dynamic> json) => _$UserModelFromJson(json);

}