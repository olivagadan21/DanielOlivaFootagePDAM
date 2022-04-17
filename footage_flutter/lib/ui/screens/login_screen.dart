import 'package:flutter/material.dart';

import 'menu_screen.dart';
import 'principal_screen.dart';

class Login extends StatelessWidget {

  const Login({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Principal()));},
                    icon: const Icon(Icons.arrow_back)
                  ),
                  const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 20),
                      child: Text(
                        'Inicia sesión',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                ],
              ),
              const Divider(color: Colors.black),
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
                                bottom: BorderSide(color: Colors.grey, width: 1)),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              hintStyle: TextStyle(color: Colors.grey),
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
                                bottom: BorderSide(color: Colors.grey, width: 1)),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Contraseña',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {},
                              ),
                              hintStyle: const TextStyle(color: Colors.grey),
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
                padding: const EdgeInsets.only(top: 60),
                child: Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(59, 181, 189, 100),
                          fixedSize: const Size(320, 40)),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));},
                      child: const Text(
                        "Inicia sesión",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30),
                child: InkWell(child: Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Color.fromRGBO(59, 181, 189, 100))),),
              )
            ],
          ),
        ),
      ),
    );
  }
  
}