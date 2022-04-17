import 'package:flutter/material.dart';

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
      initialRoute: '/principal',
      routes: {
        '/principal': (context) => const Principal(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/inicio': (context) => const Inicio(),
        '/buscar': (context) => const Buscar(),
        '/buscado': (context) => const Buscado(),
        '/detalleproducto': (context) => const DetalleProducto(),
        '/vender': (context) => const Vender(),
        '/mensajes': (context) => const Mensajes(),
        '/chat': (context) => const Chat(),
        '/perfil': (context) => const Perfil(),
        '/editarperfil': (context) => const EditarPerfil(),
      },
    );
  }
}