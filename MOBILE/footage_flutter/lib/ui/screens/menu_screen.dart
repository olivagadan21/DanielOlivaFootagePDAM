import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';

import 'buscar_screen.dart';
import 'inicio_screen.dart';
import 'mensajes_screen.dart';
import 'perfil_screen.dart';
import 'vender_screen.dart';

void main() => runApp(const Menu());

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    InicioScreen(),
    Buscar(),
    Vender(),
    Mensajes(),
    Perfil(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colores.blanco,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colores.blanco, border: Border(top: BorderSide(color: Colores.navigation, width: 1))),
        child: BottomNavigationBar(
          backgroundColor: Colores.blanco,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Inicio',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: 'Vender',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.email_outlined),
              label: 'Mensajes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colores.principal,
          unselectedItemColor: Colores.navigation,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}