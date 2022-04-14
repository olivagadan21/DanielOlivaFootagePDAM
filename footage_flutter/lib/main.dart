import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/buscado-screen.dart';
import 'package:footage_flutter/ui/screens/buscar-screen.dart';
import 'package:footage_flutter/ui/screens/chat-screen.dart';
import 'package:footage_flutter/ui/screens/detalleproducto-screen.dart';
import 'package:footage_flutter/ui/screens/editarperfil-screen.dart';
import 'package:footage_flutter/ui/screens/inicio-screen.dart';
import 'package:footage_flutter/ui/screens/login-screen.dart';
import 'package:footage_flutter/ui/screens/mensajes-screen.dart';
import 'package:footage_flutter/ui/screens/perfil-screen.dart';
import 'package:footage_flutter/ui/screens/principal-screen.dart';
import 'package:footage_flutter/ui/screens/register-screen.dart';
import 'package:footage_flutter/ui/screens/vender-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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