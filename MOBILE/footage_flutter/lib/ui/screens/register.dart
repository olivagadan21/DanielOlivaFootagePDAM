import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/auth/register_user_bloc/register_user_bloc.dart';
import 'package:footage_flutter/repository/auth/auth_repository.dart';
import 'package:footage_flutter/repository/auth/auth_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import '../../models/auth/register_dto.dart';
import 'login.dart';
import 'principal.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  late AuthRepository authRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController nombre = TextEditingController();
  TextEditingController apellidos = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _passwordVisible = false;
  bool _password2Visible = false;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _passwordVisible = false;
    _password2Visible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colores.blanco,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return RegisterBloc(authRepository);
            },
          ),
        ],
        child: _createBody(context),
      ),
    );
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colores.blanco,
          padding: const EdgeInsets.all(20),
          child: BlocConsumer<RegisterBloc, RegisterState>(
              listenWhen: (context, state) {
            return state is RegisterSuccessState || state is RegisterErrorState;
          }, listener: (context, state) async {
            if (state is RegisterSuccessState) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()),);
            } else if (state is RegisterErrorState) {
              _showSnackbar(context, state.message);
            }
          }, buildWhen: (context, state) {
            return state is RegisterInitial || state is RegisterLoading;
          }, builder: (ctx, state) {
            if (state is RegisterInitial) {
              return _register(ctx);
            } else if (state is RegisterLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return _register(ctx);
            }
          })),
    );
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _register(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                      'Reg??strate',
                      style: TextStyle(color: Colores.negro, fontSize: 20),
                    ),
                  ),
                ],
              ),
              const Divider(color: Colores.negro),
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Colores.gris, width: 1)),
                        ),
                        child: TextFormField(
                          controller: nombre,
                          decoration: const InputDecoration(
                            hintText: 'Nombre',
                            hintStyle: TextStyle(color: Colores.gris),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colores.gris, width: 1)),
                          ),
                          child: TextFormField(
                            controller: apellidos,
                            decoration: const InputDecoration(
                              hintText: 'Apellidos',
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
                                bottom:
                                    BorderSide(color: Colores.gris, width: 1)),
                          ),
                          child: TextFormField(
                            controller: username,
                            decoration: const InputDecoration(
                              hintText: 'Nombre de usuario',
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
                                bottom:
                                    BorderSide(color: Colores.gris, width: 1)),
                          ),
                          child: TextFormField(
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
                                bottom:
                                    BorderSide(color: Colores.gris, width: 1)),
                          ),
                          child: TextFormField(
                            obscureText: !_passwordVisible,
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Contrase??a',
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
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colores.gris, width: 1)),
                          ),
                          child: TextFormField(
                            obscureText: !_password2Visible,
                            controller: password2,
                            decoration: InputDecoration(
                              hintText: 'Repetir contrase??a',
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _password2Visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colores.gris,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _password2Visible = !_password2Visible;
                                  });
                                },
                              ),
                              hintStyle: const TextStyle(color: Colores.gris),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Al registrarme, confirmo que acepto los ',
                    style: TextStyle(color: Colores.negro),
                    children: <TextSpan>[
                      TextSpan(
                          text: 't??rminos de uso ',
                          style: TextStyle(
                              color: Colores.principal)),
                      TextSpan(text: 'y he le??do la '),
                      TextSpan(
                          text: 'pol??tica de privacidad',
                          style: TextStyle(
                              color: Colores.principal)),
                      TextSpan(
                          text: ', y que tengo que tengo como m??nimo 18 a??os.'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colores.principal,
                        fixedSize: const Size(320, 40)),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final registerDto = RegisterDto(
                          nombre: nombre.text,
                          apellidos: apellidos.text,
                          username: username.text,
                          email: emailController.text,
                          password2: password2.text,
                          password: passwordController.text
                        );
                        BlocProvider.of<RegisterBloc>(context).add(DoRegisterEvent(registerDto));
                      }
                    },
                    child: const Text(
                      "Reg??strate",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colores.blanco),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
