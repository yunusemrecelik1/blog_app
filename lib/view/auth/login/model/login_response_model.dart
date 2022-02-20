import 'package:json_annotation/json_annotation.dart';

import '../../../../core/base/model/base_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel extends BaseModel<LoginResponseModel> {
  @JsonKey(name: "Token")
  String? token;

  LoginResponseModel({this.token});

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
