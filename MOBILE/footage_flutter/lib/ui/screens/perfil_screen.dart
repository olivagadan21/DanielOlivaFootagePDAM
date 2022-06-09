import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/usuario/usuario_bloc.dart';
import 'package:footage_flutter/models/usuario/usuario_response.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/editarperfil_screen.dart';
import 'package:footage_flutter/ui/widgets/error_page.dart';

class PerfilScreen extends StatefulWidget  {

  const PerfilScreen({ Key? key }) : super(key: key);

  @override
  _PerfilScreenState createState() => _PerfilScreenState();

}

class _PerfilScreenState extends State<PerfilScreen> {

  late UsuarioRepository usuarioRepository;

  @override
  void initState() {
    usuarioRepository = UsuarioRepositoryImpl();
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
          return UsuarioBloc(usuarioRepository)
            ..add(const GetUsuario());
        },
        child: _createPerfil(context));
  }

}

Widget _createPerfil(BuildContext context) {
  return BlocBuilder<UsuarioBloc, UsuarioState>(
    builder: (context, state) {
      if (state is UsuarioInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is UsuarioFetchError) {
        return ErrorPage(
          message: state.message,
          retry: () {
            context.watch<UsuarioBloc>().add(const GetUsuario());
          },
        );
      } else if (state is UsuarioFetched) {
        return _perfil(context, state.usuarioResponse);
      } else {
        return const Text('Not support');
      }
    },
  );
}

Widget _perfil(BuildContext context, UsuarioResponse usuarioResponse) {
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
              DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    bottom: const TabBar(
                      tabs: [
                        Icon(Icons.checkroom),
                        Icon(Icons.favorite)
                      ],
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      Flexible(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: usuarioResponse.articulos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.white,
                              child: Image(
                                image: NetworkImage(usuarioResponse.articulos
                                  .elementAt(index)
                                  .file
                                  .toString()
                                  .replaceFirst('localhost', '10.0.2.2')),
                                fit: BoxFit.cover,
                              )
                            );
                          }
                        ),
                      ),
                      Flexible(
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: usuarioResponse.meGustas.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: Colors.white,
                              child: Image(
                                image: NetworkImage(usuarioResponse.meGustas
                                  .elementAt(index)
                                  .file
                                  .toString()
                                  .replaceFirst('localhost', '10.0.2.2')),
                                fit: BoxFit.cover,
                              )
                            );
                          }
                        ),
                      ),
                    ]
                  ),
                )
              ),
            ],
          ),
        )
      ),
    ),
  );
}