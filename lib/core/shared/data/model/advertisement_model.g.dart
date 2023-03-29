// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advertisement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdvertisementModel _$AdvertisementModelFromJson(Map<String, dynamic> json) =>
    AdvertisementModel(
      statusCode: json['statusCode'] as String,
      timestamp: json['timestamp'] as String,
      message: json['message'] as String,
      payload: (json['payload'] as List<dynamic>)
          .map((e) =>
              AdvertisementModelPayload.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdvertisementModelToJson(AdvertisementModel instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'timestamp': instance.timestamp,
      'message': instance.message,
      'payload': instance.payload.map((e) => e.toJson()).toList(),
    };

AdvertisementModelPayload _$AdvertisementModelPayloadFromJson(
        Map<String, dynamic> json) =>
    AdvertisementModelPayload(
      id: json['id'] as int,
      version: json['version'] as int,
      createDate: json['createDate'] as String,
      lastUpdate: json['lastUpdate'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      imagePath: json['imagePath'] as String,
      body: json['body'] as String,
      termsAndConditions: json['termsAndConditions'] as String,
      recordStatus: json['recordStatus'] as String,
      expiryDate: json['expiryDate'] as String,
      limitedToUserGroups: json['limitedToUserGroups'] as bool,
      limitedToUsers: json['limitedToUsers'] as bool,
      allowedUserGroups: json['allowedUserGroups'] as List<dynamic>,
      allowedUsers: json['allowedUsers'] as List<dynamic>,
      allowedNationalities: json['allowedNationalities'] as List<dynamic>,
      limitedToNationality: json['limitedToNationality'] as bool,
      appearanceOrder: json['appearanceOrder'] as int,
    );

Map<String, dynamic> _$AdvertisementModelPayloadToJson(
        AdvertisementModelPayload instance) =>
    <String, dynamic>{
      'id': instance.id,
      'version': instance.version,
      'createDate': instance.createDate,
      'lastUpdate': instance.lastUpdate,
      'name': instance.name,
      'title': instance.title,
      'imagePath': instance.imagePath,
      'body': instance.body,
      'termsAndConditions': instance.termsAndConditions,
      'recordStatus': instance.recordStatus,
      'expiryDate': instance.expiryDate,
      'limitedToUserGroups': instance.limitedToUserGroups,
      'limitedToUsers': instance.limitedToUsers,
      'allowedUserGroups': instance.allowedUserGroups,
      'allowedUsers': instance.allowedUsers,
      'allowedNationalities': instance.allowedNationalities,
      'limitedToNationality': instance.limitedToNationality,
      'appearanceOrder': instance.appearanceOrder,
    };
