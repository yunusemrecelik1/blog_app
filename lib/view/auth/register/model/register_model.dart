import 'package:blog_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel extends BaseModel<RegisterModel> {
  final String? Email;
  final String? Password;
  final String? PasswordRetry;

  RegisterModel({this.Email, this.Password,this.PasswordRetry});

  @override
  RegisterModel fromJson(Map<String, dynamic> json) {
    return _$RegisterModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterModelToJson(this);
  }
}
