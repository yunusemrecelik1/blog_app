import 'package:blog_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends BaseModel<LoginModel> {
  final String? Email;
  final String? Password;

  LoginModel({this.Email, this.Password});

  @override
  LoginModel fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
