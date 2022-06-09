import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/producto/list/productos_bloc.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';
import 'package:footage_flutter/repository/producto/producto_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/detalleproducto_screen.dart';
import 'package:footage_flutter/ui/widgets/error_page.dart';

class InicioScreen extends StatefulWidget  {

  const InicioScreen({ Key? key }) : super(key: key);

  @override
  _InicioScreenState createState() => _InicioScreenState();

}

class _InicioScreenState extends State<InicioScreen> {

  late ProductoRepository productoRepository;

  @override
  void initState() {
    productoRepository = ProductoRepositoryImpl();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return ProductosBloc(productoRepository)
        ..add(const FetchProducto());
      },
      child: Scaffold(
        body: _createProductos(context),
      ),
    );
  }  

}

Widget _createProductos(BuildContext context) {
  return BlocBuilder<ProductosBloc, ProductosState>(
    builder: (context, state) {
      if (state is ProductosInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is ProductoFetchError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context.watch<ProductosBloc>().add(const FetchProducto());
          },
        );
      } else if (state is ProductosFetched) {
        return _createPopularView(context, state.productos);
      } else {
        return const Text('Not support');
      }
    }
  );
}

Widget _createPopularView(BuildContext context, List<ProductoResponse> productos) {
  return SizedBox(
    height: MediaQuery.of(context).size.height,
    child: ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _producto(context, productos[index]);
      },
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const VerticalDivider(
        color: Colors.transparent,
        width: 6.0,
      ),
      itemCount: productos.length,
    ),
  );
}

Widget _producto(BuildContext context, ProductoResponse producto) {

  return Column(
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
                                    child: Image(image: NetworkImage(producto.usuario.avatar.replaceAll("http://localhost:8080", "http://10.0.2.2:8080")), width: 30,)
                                  )
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Text(producto.usuario.username, style: const TextStyle(fontSize: 15),),
                                )
                              ],
                            ),
                          ),
                          Image(image: NetworkImage(producto.foto.replaceAll("http://localhost:8080", "http://10.0.2.2:8080"))),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${producto.precio} €'),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(producto.marca.nombre, style: const TextStyle(color: Colores.navigation),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 6),
                                      child: Text(producto.talla.nombre, style: const TextStyle(color: Colores.navigation),),
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
  );

}
  