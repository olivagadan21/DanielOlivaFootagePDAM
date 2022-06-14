import 'package:flutter/material.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/style/styles.dart';

class DetalleUsuarioScreen extends StatefulWidget  {

  const DetalleUsuarioScreen({ Key? key, required this.usuarioResponse }) : super(key: key);

  final Usuario usuarioResponse;

  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();

}

class _UsuarioScreenState extends State<DetalleUsuarioScreen> {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {Navigator.of(context).pop();},
                      icon: const Icon(Icons.arrow_back)
                    ),
                  ],
                ),
                const Divider(color: Colores.negro),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colores.blanco, width: 1),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image(
                            image: NetworkImage(widget.usuarioResponse.avatar),
                            width: 80,
                          )
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.02,),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('${widget.usuarioResponse.nombre} ${widget.usuarioResponse.apellidos}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, softWrap: false, overflow: TextOverflow.fade),
                            Text(widget.usuarioResponse.username, style: const TextStyle(fontSize: 18, color: Colores.gris, fontWeight: FontWeight.w500),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget> [
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colores.blanco,
                              child: Image(
                                image: NetworkImage(widget.usuarioResponse.articulos.elementAt(index).foto),
                                fit: BoxFit.cover,
                              )
                            );
                          },
                          scrollDirection: Axis.vertical,
                          itemCount: widget.usuarioResponse.articulos.length,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}