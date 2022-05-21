import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/menu_screen.dart';
import 'package:footage_flutter/ui/screens/perfil_screen.dart';

class DetalleProducto extends StatelessWidget {
  const DetalleProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/images/camiseta.jpg"),
                    fit: BoxFit.cover,
                  )),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));},
                        icon: const Icon(Icons.arrow_back, color: Colores.blanco)
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border, color: Colores.blanco)
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colores.blanco, fixedSize: const Size(320, 40)),
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const Perfil()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colores.blanco, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: const Image(
                              image: AssetImage("assets/images/icono.png"),
                              width: 40,
                            )
                          )
                        ),
                        const Text("danieloliva20", style: TextStyle(fontSize: 18, color: Colores.negro)),
                        const Icon(
                          Icons.arrow_forward,
                          color: Colores.negro,
                        )
                      ],
                    )
                  ),
                ),
                Container(
                  height: 3,
                  color: Colores.gris,
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Camiseta Real Betis temporada 95/97", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Hombre · Camiseta", style: TextStyle(fontSize: 18, color: Colores.grisoscuro)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("M · Nuevo · Kappa", style: TextStyle(fontSize: 18, color: Colores.grisoscuro)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("40,00 €", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: const TextSpan(
                        text: "Intercambio: ",
                        style: TextStyle(color: Colores.grisoscuro, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: "SÍ", style: TextStyle(color:Colores.negro, fontSize: 18, fontWeight: FontWeight.bold))
                        ]
                      )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                  child: Container(
                    height: 3,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("DETALLES DEL PRODUCTO", style: TextStyle(fontSize: 18, color: Colores.grisoscuro, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus efficitur sagittis quam, id congue eros lacinia vel. Suspendisse porttitor, massa maximus sodales mattis, enim lacus euismod augue, ac ultrices est odio dictum ligula. Proin lobortis cursus odio vitae accumsan. Vestibulum vulputate, dui et ullamcorper ullamcorper, sapien turpis posuere justo, laoreet varius felis orci vel purus. Duis quis massa accumsan, malesuada purus tempor, pellentesque diam. Nunc dignissim ut tortor vel laoreet. Cras eleifend ut augue nec rutrum.", style: TextStyle(fontSize: 18, color: Colores.negro)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                  child: Container(
                    height: 3,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("ANUNCIO", style: TextStyle(fontSize: 18, color: Colores.grisoscuro, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Image(image: AssetImage("assets/images/nike.png"))
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
