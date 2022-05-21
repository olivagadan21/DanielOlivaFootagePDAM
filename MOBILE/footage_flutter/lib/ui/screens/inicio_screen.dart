import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/detalleproducto_screen.dart';

class Inicio extends StatelessWidget {

  const Inicio({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 25, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Novedades", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),
              const Divider(color: Colores.negro),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: FractionallySizedBox(
                        widthFactor: 0.75,
                        child: Card(
                          color: Colores.blanco,
                          child: InkWell(
                            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const DetalleProducto()));},
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colores.negro,
                                              width: 1
                                            ),
                                            borderRadius: BorderRadius.circular(20)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: const Image(image: AssetImage("assets/images/icono.png"), width: 30,)
                                          )
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 25),
                                          child: Text("danieloliva20", style: TextStyle(fontSize: 15),),
                                        )
                                      ],
                                    ),
                                  ),
                                  const Image(image: AssetImage("assets/images/camiseta.jpg")),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text("50 €"),
                                            Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: Text("Nike", style: TextStyle(color: Colores.navigation),),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(top: 6),
                                              child: Text("M", style: TextStyle(color: Colores.navigation),),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: const [
                                            Icon(Icons.favorite_border),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      ),
    );
  }
  
}