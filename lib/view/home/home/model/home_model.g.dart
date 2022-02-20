// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      title: json['Title'] as String?,
      image: json['Image'] as String?,
      id: json['Id'] as String?,
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'Title': instance.title,
      'Image': instance.image,
      'Id': instance.id,
    };
