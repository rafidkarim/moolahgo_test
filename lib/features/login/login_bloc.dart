import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:moolah_go/core/shared/domain/usecase/login_usecase.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase})
      : super(LoginStateImpl(username: "", password: ""));

  onUsernameChange(String val) {
    emit(state.copyWith(username: val));
  }

  onPasswordChange(String val) {
    emit(state.copyWith(password: val));
  }

  login() async {
    if (state.username!.isNotEmpty && state.password!.isNotEmpty) {
      final res = await loginUsecase.call(
          LoginParam(username: state.username!, password: state.password!));
      res.fold((l) => null, (r) {
        FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
        flutterSecureStorage.write(key: "token", value: r.token);
        emit(LoggedInSuccessfuly());
      });
    }
  }
}

@immutable
abstract class LoginState extends Equatable {
  String? username;
  String? password;

  LoginState({this.username, this.password});

  LoginState copyWith({String? username, String? password}) => LoginStateImpl(
      username: username ?? this.username, password: password ?? this.password);

  @override
  List<Object?> get props => [username, password];
}

class LoginStateImpl extends LoginState {
  LoginStateImpl({String? username, String? password})
      : super(username: username, password: password);
}

class LoggedInSuccessfuly extends LoginState {
  LoggedInSuccessfuly();
}
