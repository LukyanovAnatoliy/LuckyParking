import 'package:json_annotation/json_annotation.dart';

part 'login_result_model.g.dart';

@JsonSerializable()
class LoginResultModel{
  final String name;
  final int integer;

  LoginResultModel({required this.name, required this.integer});

  factory LoginResultModel.fromJson(Map<String, dynamic> json) => _$LoginResultModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResultModelToJson(this);
}