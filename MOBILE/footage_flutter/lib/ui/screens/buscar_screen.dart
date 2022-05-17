import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/buscado_screen.dart';

class Buscar extends StatelessWidget {

  const Buscar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text("Categorías", style: TextStyle(fontSize: 20),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Card(
                                  child: InkWell(
                                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
                                    child: SizedBox(
                                      child: Column(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image(image: AssetImage("assets/images/categoria.jpg",), width: 150,),
                                          ),
                                          Text("Camisetas")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text("Secciones", style: TextStyle(fontSize: 20),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Card(
                                  child: InkWell(
                                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
                                    child: SizedBox(
                                      child: Column(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image(image: AssetImage("assets/images/seccion.jpg"), width: 150,),
                                          ),
                                          Text("Mujer")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child: const Text("Marcas", style: TextStyle(fontSize: 20),)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Card(
                                  child: InkWell(
                                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
                                    child: SizedBox(
                                      child: Column(
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Image(image: AssetImage("assets/images/marca.jpg"), width: 150,),
                                          ),
                                          Text("Nike")
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
  
}