import 'package:blog_app/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'blog_model.g.dart';

@JsonSerializable()
class BlogModel extends BaseModel<BlogModel>{
  @JsonKey(name: 'Title')
  final String? title;
  @JsonKey(name: 'Content')
  final String? content;
  @JsonKey(name: 'Image')
  final String? image;
  @JsonKey(name: 'CategoryId')
  final String? categoryId;
  @JsonKey(name: 'Id')
  final String? id;

  bool isLiked;
  BlogModel({this.title, this.content, this.image, this.categoryId, this.id,this.isLiked = false});

  @override
  BlogModel fromJson(Map<String, dynamic> json) {
    return _$BlogModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$BlogModelToJson(this);
  }
}