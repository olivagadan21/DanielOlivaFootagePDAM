import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/buscado.dart';
import 'package:footage_flutter/ui/screens/buscar.dart';
import 'package:footage_flutter/ui/screens/editar_perfil.dart';
import 'package:footage_flutter/ui/screens/mapa.dart';
import 'package:footage_flutter/ui/screens/menu.dart';
import 'package:footage_flutter/ui/screens/perfil.dart';
import 'package:footage_flutter/ui/screens/vender.dart';
import 'package:footage_flutter/utils/preferences.dart';
import 'ui/screens/login.dart';
import 'ui/screens/principal.dart';
import 'ui/screens/register.dart';

Future<void> main() async {
  runApp(const MyApp());
  PreferenceUtils.init();
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
        '/buscar': (context) => const BuscarScreen(),
        '/buscado': (context) => const Buscado(),
        '/vender':(context) => const VenderScreen(),
        '/perfil':(context) => const PerfilScreen(),
        '/editar-perfil':(context) => const EditarPerfil(),
        '/mapa':(context) => const MapClickPage(),
      },
    );
  }
}