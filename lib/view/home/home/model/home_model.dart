import 'package:blog_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';

@JsonSerializable()
class HomeModel extends BaseModel<HomeModel>{
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Image')
  final String? image;
  @JsonKey(name: 'Id')
  final String? id;

  HomeModel({this.title, this.image, this.id});

  @override
  HomeModel fromJson(Map<String, dynamic> json) {
    return _$HomeModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$HomeModelToJson(this);
  }
}