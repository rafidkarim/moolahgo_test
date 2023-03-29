import 'package:equatable/equatable.dart';

class User extends Equatable {
  final DateTime timestamp;
  final String statusCode;
  final UserData data;
  final String message;

  const User(
      {required this.timestamp,
      required this.statusCode,
      required this.data,
      required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp, statusCode, data, message];
}

class UserData extends Equatable {
  final String userName;
  final String photo;
  final String gender;
  final String nationality;

  const UserData(
      {required this.userName,
      required this.photo,
      required this.gender,
      required this.nationality});

  @override
  // TODO: implement props
  List<Object?> get props => [userName, photo, gender, nationality];
}
