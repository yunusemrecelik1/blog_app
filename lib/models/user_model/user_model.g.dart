// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['Id'] as String?,
      email: json['Email'] as String?,
      image: json['Image'] as String?,
      location: json['Location'] == null
          ? null
          : Location.fromJson((json['Location'] as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            )),
      favoriteBlogIds: (json['FavoriteBlogIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'Id': instance.id,
      'Email': instance.email,
      'Image': instance.image,
      'Location': instance.location,
      'FavoriteBlogIds': instance.favoriteBlogIds,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      longitude: json['Longtitude'] as String?,
      latitude: json['Latitude'] as String?,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'Longtitude': instance.longitude,
      'Latitude': instance.latitude,
    };
