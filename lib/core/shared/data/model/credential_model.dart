import 'package:equatable/equatable.dart';
import 'package:moolah_go/core/shared/domain/entity/credential.dart';
import 'package:json_annotation/json_annotation.dart';

part 'credential_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CredentialModel extends Credential {
  final DateTime timestamp;
  final String statusCode;
  final String token;
  final String message;

  CredentialModel(
      {required this.timestamp,
      required this.statusCode,
      required this.token,
      required this.message})
      : super(
            message: message,
            timestamp: timestamp,
            token: token,
            statusCode: statusCode);

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialModelToJson(this);
}
