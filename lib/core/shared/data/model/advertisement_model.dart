import 'package:moolah_go/core/shared/domain/entity/advertisement.dart';
import 'package:json_annotation/json_annotation.dart';

part 'advertisement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AdvertisementModel extends Advertisement {
  final String statusCode;
  final String timestamp;
  final String message;
  final List<AdvertisementModelPayload> payload;

  const AdvertisementModel(
      {required this.statusCode,
      required this.timestamp,
      required this.message,
      required this.payload})
      : super(
            message: message,
            timestamp: timestamp,
            statusCode: statusCode,
            payload: payload);

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class AdvertisementModelPayload extends AdvertisementPayload {
  final int id;
  final int version;
  final String createDate;
  final String lastUpdate;
  final String name;
  final String title;
  final String imagePath;
  final String body;
  final String termsAndConditions;
  final String recordStatus;
  final String expiryDate;
  final bool limitedToUserGroups;
  final bool limitedToUsers;
  final List<dynamic> allowedUserGroups;
  final List<dynamic> allowedUsers;
  final List<dynamic> allowedNationalities;
  final bool limitedToNationality;
  final int appearanceOrder;

  const AdvertisementModelPayload(
      {required this.id,
      required this.version,
      required this.createDate,
      required this.lastUpdate,
      required this.name,
      required this.title,
      required this.imagePath,
      required this.body,
      required this.termsAndConditions,
      required this.recordStatus,
      required this.expiryDate,
      required this.limitedToUserGroups,
      required this.limitedToUsers,
      required this.allowedUserGroups,
      required this.allowedUsers,
      required this.allowedNationalities,
      required this.limitedToNationality,
      required this.appearanceOrder})
      : super(
            id: id,
            version: version,
            createDate: createDate,
            lastUpdate: lastUpdate,
            name: name,
            title: title,
            imagePath: imagePath,
            body: body,
            termsAndConditions: termsAndConditions,
            recordStatus: recordStatus,
            expiryDate: expiryDate,
            limitedToNationality: limitedToNationality,
            limitedToUserGroups: limitedToUserGroups,
            allowedNationalities: allowedNationalities,
            allowedUserGroups: allowedUserGroups,
            allowedUsers: allowedUsers,
            appearanceOrder: appearanceOrder,
            limitedToUsers: limitedToUsers);

  factory AdvertisementModelPayload.fromJson(Map<String, dynamic> json) =>
      _$AdvertisementModelPayloadFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementModelPayloadToJson(this);
}
