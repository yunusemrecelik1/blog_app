// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterModel _$RegisterModelFromJson(Map<String, dynamic> json) =>
    RegisterModel(
      Email: json['Email'] as String?,
      Password: json['Password'] as String?,
      PasswordRetry: json['PasswordRetry'] as String?,
    );

Map<String, dynamic> _$RegisterModelToJson(RegisterModel instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'Password': instance.Password,
      'PasswordRetry': instance.PasswordRetry,
    };
