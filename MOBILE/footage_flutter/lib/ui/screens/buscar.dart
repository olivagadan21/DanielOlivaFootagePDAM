import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/buscar/buscar_bloc.dart';
import 'package:footage_flutter/models/categoria/categoria_response.dart';
import 'package:footage_flutter/models/marca/marca_response.dart';
import 'package:footage_flutter/models/seccion/seccion_response.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository_impl.dart';
import 'package:footage_flutter/repository/marca/marca_repository.dart';
import 'package:footage_flutter/repository/marca/marca_repository_impl.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository_impl.dart';
import 'package:footage_flutter/ui/screens/buscado.dart';
import 'package:footage_flutter/ui/widgets/error_page.dart';

class BuscarScreen extends StatefulWidget  {

  const BuscarScreen({ Key? key }) : super(key: key);

  @override
  _BuscarScreenState createState() => _BuscarScreenState();

}

class _BuscarScreenState extends State<BuscarScreen> {

  late CategoriaRepository categoriaRepository;
  late SeccionRepository seccionRepository;
  late MarcaRepository marcaRepository;

  @override
  void initState() {
    categoriaRepository = CategoriaRepositoryImpl();
    seccionRepository = SeccionRepositoryImpl();
    marcaRepository = MarcaRepositoryImpl();
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
        return BuscarBloc(categoriaRepository, seccionRepository, marcaRepository)
        ..add(const FetchBuscar());
      },
      child: Scaffold(
        body: _createBuscar(context),
      ),
    );
  }

}

Widget _createBuscar(BuildContext context) {
  return BlocBuilder<BuscarBloc, BuscarState>(
    builder: (context, state) {
      if (state is BuscarInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is BuscarFetchError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context.watch<BuscarBloc>().add(const FetchBuscar());
          },
        );
      } else if (state is BuscarFetched) {
        return _createBuscarView(context, state.categorias, state.secciones, state.marcas);
      } else {
        return const Text('Not support');
      }
    }
  );
}

Widget _createBuscarView (BuildContext context, List<CategoriaResponse> categorias, List<SeccionResponse> secciones, List<MarcaResponse> marcas) {
  return SingleChildScrollView(
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.02),
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
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return _categorias(context, categorias[index]);
                          },
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const VerticalDivider(
                            color: Colors.transparent,
                            width: 6.0,
                          ),
                          itemCount: categorias.length
                        ),
                      ),
                    ),
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
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return _secciones(context, secciones[index]);
                          },
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const VerticalDivider(
                            color: Colors.transparent,
                            width: 6.0,
                          ),
                          itemCount: secciones.length
                        ),
                      ),
                    ),
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
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index) {
                            return _marcas(context, marcas[index]);
                          },
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => const VerticalDivider(
                            color: Colors.transparent,
                            width: 6.0,
                          ),
                          itemCount: marcas.length
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
    ),
  );
}

Widget _categorias (BuildContext context, CategoriaResponse categoriaResponse) {
  return Row(
    children: [
      Card(
        child: InkWell(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(image: NetworkImage(categoriaResponse.imagen), width: 150,),
                ),
                Text(categoriaResponse.nombre)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _secciones (BuildContext context, SeccionResponse seccionResponse) {
  return Row(
    children: [
      Card(
        child: InkWell(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(image: NetworkImage(seccionResponse.imagen.replaceAll("http://localhost:8080", "http://localhost:8080")), width: 150,),
                ),
                Text(seccionResponse.nombre)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _marcas (BuildContext context, MarcaResponse marcaResponse) {
  return Row(
    children: [
      Card(
        child: InkWell(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Buscado()));},
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image(image: NetworkImage(marcaResponse.imagen.replaceAll("http://localhost:8080", "http://localhost:8080")), width: 150,),
                ),
                Text(marcaResponse.nombre)
              ],
            ),
          ),
        ),
      ),
    ],
  );
}