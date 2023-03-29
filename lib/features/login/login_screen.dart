import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:moolah_go/core/shared/domain/usecase/login_usecase.dart';
import 'package:moolah_go/core/widgets/app_textfield.dart';
import 'package:moolah_go/features/ads/ads_screen.dart';
import 'package:moolah_go/features/login/login_bloc.dart';

class LoginScreen extends StatefulWidget {
  static initiateScreen() => BlocProvider(
        create: (_) => LoginBloc(loginUsecase: GetIt.I<LoginUsecase>()),
        child: LoginScreen(),
      );

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(builder: (_, constraints) {
        return Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          padding: const EdgeInsets.all(10),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (_, state) {
              if (state is LoggedInSuccessfuly) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) {
                  return AdsScreen.initiateScreen();
                }));
              }
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage("assets/images/logo.png"))),
                  ),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    hintText: "Username",
                    onChanged: context.read<LoginBloc>().onUsernameChange,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AppTextField(
                    hintText: "Password",
                    obscure: true,
                    onChanged: context.read<LoginBloc>().onPasswordChange,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: constraints.maxWidth,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.orangeAccent)),
                          onPressed: context.read<LoginBloc>().login,
                          child: Text("Login")))
                ]),
          ),
        );
      }),
    );
  }
}
