import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_achitecture/features/data/models/request/login_request.dart';
import 'package:flutter_clean_achitecture/features/di/injection_container.dart';
import 'package:flutter_clean_achitecture/features/presentation/blocs/login-bloc/login_bloc.dart';
import 'package:flutter_clean_achitecture/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginBloc = sl<LoginBloc>();

  void _loginButtonPressed() {
    _loginBloc.add(
      MakeLoginRequest(
        LoginRequest(
          username: "Joeminority06@gmail.com",
          password: "aankanka",
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            logger.d("onLoading");
          }

          if (state is LoginFailed) {
            logger.d("Failed message ${state.message}");
          }

          if (state is LoginSuccess) {
            logger.d("Login Success");
          }
        },
        child: GestureDetector(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        TextButton(
                          style: TextButton.styleFrom(
                            fixedSize: Size(400, 44),
                            foregroundColor: Color(0xFF5B16D0),
                            backgroundColor: Color(0xFF5B16D0),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: _loginButtonPressed,
                          child: Text(
                            'Login',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15.0),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
