import 'package:equatable/equatable.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moolah_go/core/shared/domain/entity/user.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class UserModel extends User {
  final DateTime timestamp;
  final String statusCode;
  final UserDataModel data;
  final String message;

  const UserModel(
      {required this.timestamp,
      required this.statusCode,
      required this.data,
      required this.message})
      : super(
            data: data,
            timestamp: timestamp,
            statusCode: statusCode,
            message: message);

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UserDataModel extends UserData {
  final String userName;
  final String photo;
  final String gender;
  final String nationality;

  const UserDataModel(
      {required this.userName,
      required this.photo,
      required this.gender,
      required this.nationality})
      : super(
            userName: userName,
            photo: photo,
            gender: gender,
            nationality: nationality);

  factory UserDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataModelToJson(this);
}
