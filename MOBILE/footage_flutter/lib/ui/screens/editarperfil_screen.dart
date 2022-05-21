import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/mapa.dart';
import 'package:footage_flutter/ui/screens/menu_screen.dart';

class EditarPerfil extends StatelessWidget {

  const EditarPerfil({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.04),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));}, icon: const Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                  child: Container(
                    color: Colores.gris,
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colores.negro, width: 1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: const Image(
                              image: AssetImage("assets/images/icono.png"),
                              width: 100,
                            )
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                          child: InkWell(
                            child: const Text("Editar avatar"),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(bottom: BorderSide(color: Colores.gris, width: 1)),
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Daniel',
                            hintStyle: TextStyle(color: Colores.negro),
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
                            decoration: const InputDecoration(
                              hintText: 'Oliva García',
                              hintStyle: TextStyle(color: Colores.negro),
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
                            decoration: const InputDecoration(
                              hintText: 'danioliva20',
                              hintStyle: TextStyle(color: Colores.negro),
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
                            enabled: false,
                            decoration: const InputDecoration(
                              hintText: 'oliva.gadan21@triana.salesianos.edu',
                              hintStyle: TextStyle(color: Colores.gris),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  child: SizedBox(
                    width:MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.04,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colores.blanco,
                        side: const BorderSide(width: 1)
                      ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MapClickPage()));},
                      child: const Text("Editar ubicación", style: TextStyle(fontSize: 14, color: Colores.negro),)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.08, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colores.principal,
                            fixedSize: Size(MediaQuery.of(context).size.width, 40)),
                        onPressed: () {},
                        child: const Text(
                          "Guardar",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colores.blanco),
                        )),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
  
}