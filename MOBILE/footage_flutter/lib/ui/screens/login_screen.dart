import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/auth/login_bloc/login_bloc.dart';
import 'package:footage_flutter/models/auth/login_dto.dart';
import 'package:footage_flutter/models/auth/login_response.dart';
import 'package:footage_flutter/repository/auth/auth_repository.dart';
import 'package:footage_flutter/repository/auth/auth_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_screen.dart';
import 'principal_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Future<SharedPreferences> _prefs;
  bool _passwordVisible = false;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _prefs = SharedPreferences.getInstance();
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) {
          return LoginBloc(authRepository);
        },
        child: _createBody(context));
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colores.blanco,
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<LoginBloc, LoginState>(
              listenWhen: (context, state) {
            return state is LoginSuccessState || state is LoginErrorState;
          }, listener: (context, state) async {
            if (state is LoginSuccessState) {
              _loginSuccess(context, state.loginResponse);
            } else if (state is LoginErrorState) {
              _showSnackbar(context, state.message);
            }
          }, buildWhen: (context, state) {
            return state is LoginInitialState || state is LoginLoadingState;
          }, builder: (ctx, state) {
            if (state is LoginInitialState) {
              return _login(ctx);
            } else if (state is LoginLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _login(ctx);
            }
          })),
    );
  }

  Future<void> _loginSuccess(BuildContext context, LoginResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString('token', late.token);
      prefs.setString('id', late.id);
      prefs.setString('avatar', late.avatar);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Menu()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _login(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Principal()));
                    },
                    icon: const Icon(Icons.arrow_back)),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 20),
                  child: Text(
                    'Inicia sesión',
                    style: TextStyle(color: Colores.negro, fontSize: 20),
                  ),
                ),
              ],
            ),
            const Divider(color: Colores.negro),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colores.gris, width: 1)),
                        ),
                        child: TextFormField(
                          validator: (String? value) {
                            return (value == null || !value.contains('@'))
                                ? 'No tiene formato email'
                                : null;
                          },
                          onSaved: (String? value) {},
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colores.gris),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colores.gris, width: 1)),
                        ),
                        child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colores.gris,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hintStyle: const TextStyle(color: Colores.gris),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            onSaved: (String? value) {},
                            validator: (value) {
                              return (value == null || value.isEmpty)
                                  ? 'Escribe la contraseña'
                                  : null;
                            }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60),
              child: Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colores.principal,
                        fixedSize: const Size(320, 40)),
                    onPressed: () {
                      /*if (_formKey.currentState!.validate()) {
                          final loginDto = LoginDto(
                              email: emailController.text,
                              password: passwordController.text);
                          BlocProvider.of<LoginBloc>(context)
                              .add(DoLoginEvent(loginDto));
                        }*/Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));
                    },
                    child: const Text(
                      "Inicia sesión",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colores.blanco),
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: InkWell(
                child: Text("¿Olvidaste tu contraseña?",
                    style: TextStyle(color: Colores.principal)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
