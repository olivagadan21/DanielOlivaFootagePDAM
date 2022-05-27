import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/image/image_bloc.dart';
import 'package:footage_flutter/bloc/producto/create/producto_bloc.dart';
import 'package:footage_flutter/bloc/producto/list/productos_bloc.dart';
import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';
import 'package:footage_flutter/repository/producto/producto_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_screen.dart';

class VenderScreen extends StatefulWidget {

  const VenderScreen({ Key? key }) : super(key: key);

@override
_RegisterScreenState createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<VenderScreen> {
  String imageSelect = "Imagen no selecionada";
  FilePickerResult? result;
  PlatformFile? file;
  late ProductoRepository _productoRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titulo = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController precio = TextEditingController();
  bool? intercambio;
  bool? original;
  Usuario? usuario;
  Seccion? seccion;
  Categoria? categoria;
  Marca? marca;
  Talla? talla;
  late Future<SharedPreferences> _prefs;
  String path = "";

  @override
  void initState() {
    _productoRepository = ProductoRepositoryImpl();
    _prefs = SharedPreferences.getInstance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return ImageBloc();
            },
          ),
          BlocProvider(
            create: (context) {
              return ProductosBloc(_productoRepository);
            },
          ),
        ],
        child: _createBody(context),
      ),
    );
  }

  _createBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(20),
            child: BlocConsumer<ProductoBloc, ProductoState>(
                listenWhen: (context, state) {
              return state is ProductoSuccessState ||
                  state is ProductoCreateError;
            }, listener: (context, state) async {
              if (state is ProductoSuccessState) {
                _createSuccess(context, state.producto);
              } else if (state is ProductoCreateError) {
                _showSnackbar(context, state.message);
              }
            }, buildWhen: (context, state) {
              return state is ProductoInitial ||
                  state is ProductoLoadingState;
            }, builder: (ctx, state) {
              if (state is ProductoInitial) {
                return _create(ctx);
              } else if (state is ProductoLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return _create(ctx);
              }
            })),
      ),
    );
  }

  Future<void> _createSuccess(BuildContext context, ProductoResponse late) async {
    _prefs.then((SharedPreferences prefs) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Menu()),
      );
    });
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  _create(BuildContext context) {
    String selectedValueSeccion = "";
    String selectedValueCategoria = "";
    String selectedValueTalla = "";
    String selectedValueMarca = "";
    String selectedValueEstado = "";
    return SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01, bottom: MediaQuery.of(context).size.height*0.02),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));}, icon: const Icon(Icons.close), color: Colores.gris),
                    const Padding(
                      padding: EdgeInsets.only(left:15),
                      child: Text("Vender", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colores.gris),),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                  child: Container(
                    height: 3,
                    color: Colores.gris,
                  ),
                ),
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.3,
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colores.blanco,
                        fixedSize: const Size(200, 40),
                        side: const BorderSide(color: Colores.principal, width: 2)
                      ),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Icon(Icons.add, color: Colores.principal,),
                          Text("Subir fotos", style: TextStyle(color: Colores.principal, fontSize: 18),)
                        ],
                      )
                    ),
                  ),
                ), 
                Container(
                  height: 8,
                  color: Colores.gris,
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextFormField(
                      controller: titulo,
                      decoration: InputDecoration(
                        labelText: 'Título',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colores.gris, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.065),
                  child: Container(
                    height: 1,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    height: MediaQuery.of(context).size.height*0.2,
                    child: TextFormField(
                      controller: descripcion,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      minLines: 1,
                      maxLines: 6,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Descripción',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03),
                  child: Container(
                    height: 8,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: DropdownButtonFormField(
                      value: selectedValueSeccion,
                      items: ,
                      decoration: const InputDecoration(
                        labelText: "Sección",
                        labelStyle: TextStyle(fontSize: 18)
                      ),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValueSeccion = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: DropdownButtonFormField(
                      value: selectedValueCategoria,
                      items: dropdownCategoria,
                      decoration: const InputDecoration(
                        labelText: "Categoría",
                        labelStyle: TextStyle(fontSize: 18)
                      ),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValueCategoria = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: DropdownButtonFormField(
                      value: selectedValueTalla,
                      items: dropdownTalla,
                      decoration: const InputDecoration(
                        labelText: "Talla",
                        labelStyle: TextStyle(fontSize: 18)
                      ),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValueTalla = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: DropdownButtonFormField(
                      value: selectedValueMarca,
                      items: dropdownMarca,
                      decoration: const InputDecoration(
                        labelText: "Marca",
                        labelStyle: TextStyle(fontSize: 18)
                      ),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValueMarca = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: DropdownButtonFormField(
                      value: selectedValueEstado,
                      items: dropdownEstado,
                      decoration: const InputDecoration(
                        labelText: "Estado",
                        labelStyle: TextStyle(fontSize: 18)
                      ),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValueEstado = newValue!;
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.06),
                  child: Container(
                    height: 8,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Precio',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colores.gris, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.05),
                  child: Container(
                    height: 1,
                    color: Colores.gris,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colores.principal,
                            fixedSize: const Size(320, 40)),
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          if (_formKey.currentState!.validate()) {
                            final producto = ProductoDto(
                              titulo: titulo.text,
                              descripcion: descripcion.text,
                              precio: precio,
                              intercambio: (intercambio=='true')?true:false,
                              original: (original=='true')?true:false,
                              usuario: usuario,
                              seccion: seccion,
                              categoria: categoria,
                              marca: marca,
                              talla: talla
                            );
                            titulo = titulo.text,
                          }
                        },
                        child: const Text(
                          "Subir",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colores.blanco),
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.04), bottom: (MediaQuery.of(context).size.height*0.04), left:(MediaQuery.of(context).size.width*0.08), right: (MediaQuery.of(context).size.width*0.08)),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Un vendedor profesional simulando ser un consumidor o usuario no profesional en Footage incurrirá en las sanciones previstas en los artículos 49 y subsiguientes del Real Decreto Legislativo 1/2007.", style: TextStyle(fontSize: 14, color: Colores.gris)),
                  ),
                ),
              ],
            ),
          )
        ),
      );
  }
  
}

List<DropdownMenuItem<String>> get dropdownSeccion{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text(""),value: ""),
    const DropdownMenuItem(child: Text("Hombre"),value: "Hombre"),
    const DropdownMenuItem(child: Text("Mujer"),value: "Mujer"),
    const DropdownMenuItem(child: Text("Otro"),value: "Otro"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownCategoria{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text(""),value: ""),
    const DropdownMenuItem(child: Text("Camiseta"),value: "Camiseta"),
    const DropdownMenuItem(child: Text("Bufanda"),value: "Bufanda"),
    const DropdownMenuItem(child: Text("Otro"),value: "Otro"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownMarca{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text(""),value: ""),
    const DropdownMenuItem(child: Text("Nike"),value: "Nike"),
    const DropdownMenuItem(child: Text("Adidas"),value: "Adidas"),
    const DropdownMenuItem(child: Text("Puma"),value: "Puma"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownTalla{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text(""),value: ""),
    const DropdownMenuItem(child: Text("S"),value: "S"),
    const DropdownMenuItem(child: Text("M"),value: "M"),
    const DropdownMenuItem(child: Text("L"),value: "L"),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get dropdownEstado{
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text(""),value: ""),
    const DropdownMenuItem(child: Text("Sobresaliente"),value: "Sobresaliente"),
    const DropdownMenuItem(child: Text("Notable"),value: "Notable"),
    const DropdownMenuItem(child: Text("Bien"),value: "Bien"),
    const DropdownMenuItem(child: Text("Suficiente"),value: "Suficiente"),
    const DropdownMenuItem(child: Text("Insuficiente"),value: "Insuficiente"),
  ];
  return menuItems;
}

/* child: BlocConsumer<ImageBloc, ImageState>(
                      listenWhen: (context, state) {
                        return state is ImageSelectedSuccessState;
                      },
                      listener: (context, state) {},
                      buildWhen: (context, state) {
                        return state is ImageInitial ||
                            state is ImageSelectedSuccessState;
                      },
                      builder: (context, state) {
                        if (state is ImageSelectedSuccessState) {
                          var path = state.pickedFile.path;
                          print('PATH ${state.pickedFile.path}');
                          return Column(children: [
                            Image.file(
                              File(state.pickedFile.path),
                              height: 100,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.red,
                              ),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                prefs.setString('file', path);
                              },
                              child: const Text('Cargar Imagen')
                            )
                          ]);
                        }
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<ImageBloc>(context)
                                  .add(const SelectImageEvent(
                                      ImageSource.gallery));
                            },
                            child: const Text('Seleccionar Imagen')
                          ),
                        );
                      }
                    ),*/