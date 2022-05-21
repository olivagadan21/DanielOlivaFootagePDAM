import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/buscado_screen.dart';
import 'package:footage_flutter/ui/screens/buscar_screen.dart';
import 'package:footage_flutter/ui/screens/chat_screen.dart';
import 'package:footage_flutter/ui/screens/detalleproducto_screen.dart';
import 'package:footage_flutter/ui/screens/editarperfil_screen.dart';
import 'package:footage_flutter/ui/screens/mapa.dart';
import 'package:footage_flutter/ui/screens/mensajes_screen.dart';
import 'package:footage_flutter/ui/screens/menu_screen.dart';
import 'package:footage_flutter/ui/screens/perfil_screen.dart';
import 'package:footage_flutter/ui/screens/vender_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/principal_screen.dart';
import 'ui/screens/register_screen.dart';

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
        '/menu': (context) => const Menu(),
        '/detalleproducto':(context) => const DetalleProducto(),
        '/buscar': (context) => const Buscar(),
        '/buscado': (context) => const Buscado(),
        '/vender':(context) => const Vender(),
        '/mensajes':(context) => const Mensajes(),
        '/chat':(context) => const Chat(),
        '/perfil':(context) => const Perfil(),
        '/editar-perfil':(context) => const EditarPerfil(),
        '/mapa':(context) => const MapClickPage(),
      },
    );
  }
}