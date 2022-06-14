import 'package:flutter/material.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/detalle_usuario.dart';
import 'package:footage_flutter/ui/screens/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetalleProducto extends StatefulWidget {
  const DetalleProducto({Key? key, required this.productoResponse}) : super(key: key);

  final ProductoResponse productoResponse;

  @override
  _DetalleProductoState createState() => _DetalleProductoState();

}

class _DetalleProductoState extends State<DetalleProducto> {
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
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(widget.productoResponse.foto,), fit: BoxFit.cover,)
                  ),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetalleUsuarioScreen(usuarioResponse: widget.productoResponse.usuario)));
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
                            child: Image(image: NetworkImage(widget.productoResponse.usuario.avatar), width: 40,)
                          )
                        ),
                        Text(widget.productoResponse.usuario.username, style: const TextStyle(fontSize: 18, color: Colores.negro)),
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
                    child: Text(widget.productoResponse.titulo, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('${widget.productoResponse.seccion.nombre} · ${widget.productoResponse.categoria.nombre}', style: const TextStyle(fontSize: 18, color: Colores.grisoscuro)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('${widget.productoResponse.talla.nombre} · ${widget.productoResponse.estado} · ${widget.productoResponse.marca.nombre}', style: const TextStyle(fontSize: 18, color: Colores.grisoscuro)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text('${widget.productoResponse.precio} €', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        text: "Intercambio: ",
                        style: const TextStyle(color: Colores.grisoscuro, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(text: widget.productoResponse.intercambio.toString(), style: const TextStyle(color:Colores.negro, fontSize: 18, fontWeight: FontWeight.bold))
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
                    child: Text(widget.productoResponse.descripcion, style: const TextStyle(fontSize: 18, color: Colores.negro)),
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
                  child: InkWell(
                    onTap: () => _launchURL(widget.productoResponse),
                    child: Image(image: NetworkImage(widget.productoResponse.anuncio.imagen)),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_launchURL(ProductoResponse productoResponse) async {
  var url = productoResponse.anuncio.url;
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}