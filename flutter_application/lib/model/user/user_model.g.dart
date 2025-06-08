// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      sex: json['sex'] as String?,
      profileImage: json['profileImage'] as String?,
      glucoseValue: json['glucoseValue'] as String?,
      heartRateValue: json['heartRateValue'] as String?,
      stepsValue: json['stepsValue'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'dob': instance.dob?.toIso8601String(),
      'sex': instance.sex,
      'profileImage': instance.profileImage,
      'glucoseValue': instance.glucoseValue,
      'heartRateValue': instance.heartRateValue,
      'stepsValue': instance.stepsValue,
    };
