import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';

import 'login_screen.dart';
import 'register_screen.dart';

class Principal extends StatelessWidget {

  const Principal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:Colores.principal,
                        border: Border.all(
                          color:Colores.principal,
                          width: 3
                        ),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: const Image(
                          image: AssetImage("assets/images/principal.jpg")
                        )
                      )
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 25, right: 25),
                child: Text("Vende productos de fútbol que ya no utilices sin pagar comisión.", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text("¡Únete ahora!", textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(primary:Colores.principal, fixedSize: const Size(280, 40)), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));}, child: const Text("Crea tu perfil en Footage", textAlign: TextAlign.center, style: TextStyle(color: Colores.blanco),)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colores.blanco, fixedSize: const Size(280, 40), side: const BorderSide(width: 2, color: Colores.principal)), onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));}, child: const Text("Ya tengo una cuenta", textAlign: TextAlign.center, style: TextStyle(color: Colores.principal),)),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
  
}