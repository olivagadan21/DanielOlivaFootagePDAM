import 'package:flutter/material.dart';

import 'menu_screen.dart';
import 'principal_screen.dart';

class Register extends StatelessWidget {

  const Register({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Principal()));}, icon: const Icon(Icons.arrow_back)),
                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 20),
                      child: Text(
                        'Regístrate',
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
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey, width: 1)),
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Nombre',
                              hintStyle: TextStyle(color: Colors.grey),
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
                                  bottom: BorderSide(color: Colors.grey, width: 1)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Apellidos',
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
                              decoration: const InputDecoration(
                                hintText: 'Nombre de usuario',
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
                                    Icons.visibility,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey, width: 1)),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Repetir contraseña',
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
                  padding: const EdgeInsets.only(top: 40),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Al registrarme, confirmo que acepto los ',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'términos de uso ',
                            style: TextStyle(
                                color: Color.fromRGBO(59, 181, 189, 100))),
                        TextSpan(text: 'y he leído la '),
                        TextSpan(
                            text: 'política de privacidad',
                            style: TextStyle(
                                color: Color.fromRGBO(59, 181, 189, 100))),
                        TextSpan(
                            text: ', y que tengo que tengo como mínimo 18 años.'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(59, 181, 189, 100),
                            fixedSize: const Size(320, 40)),
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));},
                        child: const Text(
                          "Regístrate",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}