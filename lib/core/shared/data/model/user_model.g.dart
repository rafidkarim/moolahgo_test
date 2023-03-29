// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      timestamp: DateTime.parse(json['timestamp'] as String),
      statusCode: json['statusCode'] as String,
      data: UserDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'statusCode': instance.statusCode,
      'data': instance.data.toJson(),
      'message': instance.message,
    };

UserDataModel _$UserDataModelFromJson(Map<String, dynamic> json) =>
    UserDataModel(
      userName: json['userName'] as String,
      photo: json['photo'] as String,
      gender: json['gender'] as String,
      nationality: json['nationality'] as String,
    );

Map<String, dynamic> _$UserDataModelToJson(UserDataModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'photo': instance.photo,
      'gender': instance.gender,
      'nationality': instance.nationality,
    };
