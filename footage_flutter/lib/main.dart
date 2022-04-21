import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/menu_screen.dart';

import 'ui/screens/buscado_screen.dart';
import 'ui/screens/buscar_screen.dart';
import 'ui/screens/chat_screen.dart';
import 'ui/screens/detalleproducto_screen.dart';
import 'ui/screens/editarperfil_screen.dart';
import 'ui/screens/inicio_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/mensajes_screen.dart';
import 'ui/screens/perfil_screen.dart';
import 'ui/screens/principal_screen.dart';
import 'ui/screens/register_screen.dart';
import 'ui/screens/vender_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Footage',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/menu',
      routes: {
        '/principal': (context) => const Principal(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/menu': (context) => const Menu()
      },
    );
  }
}