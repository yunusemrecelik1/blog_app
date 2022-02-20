// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      title: json['Title'] as String?,
      content: json['Content'] as String?,
      image: json['Image'] as String?,
      categoryId: json['CategoryId'] as String?,
      id: json['Id'] as String?,
      isLiked: json['isLiked'] as bool? ?? false,
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Content': instance.content,
      'Image': instance.image,
      'CategoryId': instance.categoryId,
      'Id': instance.id,
      'isLiked': instance.isLiked,
    };
