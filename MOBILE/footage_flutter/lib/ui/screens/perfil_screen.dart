import 'package:flutter/material.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/editarperfil_screen.dart';

class Perfil extends StatelessWidget {

  const Perfil({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.04),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colores.blanco, width: 1),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                          image: AssetImage("assets/images/icono.png"),
                          width: 80,
                        )
                      )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.02,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Daniel Oliva García", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, softWrap: false, overflow: TextOverflow.fade),
                          Text("danioliva20", style: TextStyle(fontSize: 18, color: Colores.gris, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.03),
                  child: SizedBox(
                    width:MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colores.blanco,
                        side: const BorderSide(width: 1)
                      ),
                      onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarPerfil()));},
                      child: const Text("Editar perfil", style: TextStyle(fontSize: 18, color: Colores.negro),)
                    ),
                  ),
                ),
                /*Flexible(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: user.articulos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return const Card(
                        color: Colores.blanco,
                        child: Image(image: NetworkImage(user.publicaciones.elementAt(index).file.toString().replaceFirst('localhost', '10.0.2.2')), fit: BoxFit.cover,),
                      );
                    },
                  )
                )*/
              ],
            ),
          )
        ),
      ),
    );
  }
  
}