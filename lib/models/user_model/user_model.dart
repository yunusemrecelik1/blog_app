import 'package:blog_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends BaseModel<UserModel>{
  @JsonKey(name: 'Id')
  final String? id;
  @JsonKey(name: 'Email')
  final String? email;
  @JsonKey(name: 'Image')
  final String? image;
  @JsonKey(name: 'Location')
  final Location? location;
  @JsonKey(name:'FavoriteBlogIds')
  final List<String>? favoriteBlogIds;

  UserModel({this.id, this.email, this.image, this.location, this.favoriteBlogIds});

  @override
  UserModel fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}

@JsonSerializable()
class Location extends BaseModel<Location>{
  @JsonKey(name: 'Longtitude')
  String? longitude;
  @JsonKey(name: 'Latitude')
  String? latitude;

  Location({this.longitude, this.latitude});
  @override
  Location fromJson(Map<String, dynamic> json) {
    return _$LocationFromJson(json);
  }
  factory Location.fromJson(Map<String, Object> json) {
    return _$LocationFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LocationToJson(this);
  }
}