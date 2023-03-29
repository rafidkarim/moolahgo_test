import 'package:equatable/equatable.dart';

class Advertisement extends Equatable {
  final String statusCode;
  final String timestamp;
  final String message;
  final List<AdvertisementPayload> payload;

  const Advertisement(
      {required this.statusCode,
      required this.timestamp,
      required this.message,
      required this.payload});

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, timestamp, message, payload];
}

class AdvertisementPayload extends Equatable {
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

  const AdvertisementPayload(
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
      required this.appearanceOrder});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        version,
        createDate,
        lastUpdate,
        name,
        title,
        imagePath,
        body,
        termsAndConditions,
        recordStatus,
        expiryDate,
        limitedToNationality,
        limitedToUserGroups,
        termsAndConditions,
        recordStatus,
        expiryDate,
        allowedNationalities,
        allowedNationalities,
        appearanceOrder
      ];
}
