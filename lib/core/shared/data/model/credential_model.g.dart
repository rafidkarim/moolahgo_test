// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credential_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CredentialModel _$CredentialModelFromJson(Map<String, dynamic> json) =>
    CredentialModel(
      timestamp: DateTime.parse(json['timestamp'] as String),
      statusCode: json['statusCode'] as String,
      token: json['token'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$CredentialModelToJson(CredentialModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp.toIso8601String(),
      'statusCode': instance.statusCode,
      'token': instance.token,
      'message': instance.message,
    };
