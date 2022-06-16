import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/usuario/usuario_bloc.dart';
import 'package:footage_flutter/models/usuario/usuario_response.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository.dart';
import 'package:footage_flutter/repository/usuario/usuario_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/editar_perfil.dart';
import 'package:footage_flutter/ui/screens/login.dart';
import 'package:footage_flutter/ui/widgets/error_page.dart';

import '../../models/usuario/perfil_response.dart';

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
        return _perfil(context, state.profileResponse);
      } else {
        return const Text('Not support');
      }
    },
  );
}

Widget _perfil(BuildContext context, ProfileResponse profileResponse) {
  return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 20, bottom: 20),
              child: Container(
                alignment: Alignment.topLeft,
                child: const Text("Perfil", style: TextStyle(fontSize: 20),)
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
            ),
            Padding(
              padding: const EdgeInsets.only(top:20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colores.negro, width: 1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image(
                        image: NetworkImage(profileResponse.avatar),
                        width: 80,
                      )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.08,),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${utf8.decode(utf8.encode(profileResponse.nombre))} ${utf8.decode(utf8.encode(profileResponse.apellidos))}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), maxLines: 1, softWrap: false, overflow: TextOverflow.fade),
                        Text(utf8.decode(utf8.encode(profileResponse.username)), style: const TextStyle(fontSize: 18, color: Colores.gris, fontWeight: FontWeight.w500),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colores.blanco,
                  side: const BorderSide(width: 0, color: Colores.blanco)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => EditarPerfil(profileResponse: profileResponse)));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Editar Perfil", style: TextStyle(fontSize: 18, color: Colores.negro),),
                    Icon(Icons.arrow_forward, color: Colores.grisoscuro,)
                  ],
                )
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
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
                        return Padding(
                          padding: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.2, right: MediaQuery.of(context).size.width*0.2, top: MediaQuery.of(context).size.width*0.05, bottom: MediaQuery.of(context).size.width*0.05),
                          child: Card(
                            color: Colores.blanco,
                            child: Image(
                              image: NetworkImage(profileResponse.articulos.elementAt(index).foto),
                              fit: BoxFit.cover,
                            )
                          ),
                        );
                      },
                      scrollDirection: Axis.vertical,
                      itemCount: profileResponse.articulos.length,
                    ),
                  ),
                ),
              ],
            )
            /* 
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colores.blanco,
                  side: const BorderSide(width: 0, color: Colores.blanco)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarPerfil()));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Tus Artículos", style: TextStyle(fontSize: 18, color: Colores.negro),),
                    Icon(Icons.arrow_forward, color: Colores.grisoscuro,)
                  ],
                )
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colores.blanco,
                  side: const BorderSide(width: 0, color: Colores.blanco)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarPerfil()));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Artículos Favoritos", style: TextStyle(fontSize: 18, color: Colores.negro),),
                    Icon(Icons.arrow_forward, color: Colores.grisoscuro,)
                  ],
                )
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colores.blanco,
                  side: const BorderSide(width: 0, color: Colores.blanco)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarPerfil()));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Mi Saldo", style: TextStyle(fontSize: 18, color: Colores.negro),),
                    Icon(Icons.arrow_forward, color: Colores.grisoscuro,)
                  ],
                )
              ),
            ),
            Container(
              height: 5,
              color: Colores.grismedioclaro,
            ),
            SizedBox(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colores.blanco,
                  side: const BorderSide(width: 0, color: Colores.blanco)
                ),
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Cerrar Sesión", style: TextStyle(fontSize: 18, color: Colores.negro),),
                    Icon(Icons.arrow_forward, color: Colores.grisoscuro,)
                  ],
                )
              ),
            ), */
          ],
        )
      ),
    ),
  );
}