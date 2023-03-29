import 'package:equatable/equatable.dart';

class Credential extends Equatable {
  final DateTime timestamp;
  final String statusCode;
  final String token;
  final String message;

  Credential(
      {required this.timestamp,
      required this.statusCode,
      required this.token,
      required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp, statusCode, token, message];
}
