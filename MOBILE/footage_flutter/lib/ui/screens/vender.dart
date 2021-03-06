import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footage_flutter/bloc/image/image_bloc.dart';
import 'package:footage_flutter/bloc/producto/create/producto_bloc.dart';
import 'package:footage_flutter/models/categoria/categoria_response.dart';
import 'package:footage_flutter/models/marca/marca_response.dart';
import 'package:footage_flutter/models/producto/producto_dto.dart';
import 'package:footage_flutter/models/producto/producto_response.dart';
import 'package:footage_flutter/models/talla/talla_response.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository.dart';
import 'package:footage_flutter/repository/marca/marca_repository.dart';
import 'package:footage_flutter/repository/marca/marca_repository_impl.dart';
import 'package:footage_flutter/repository/producto/producto_repository.dart';
import 'package:footage_flutter/repository/producto/producto_repository_impl.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository_impl.dart';
import 'package:footage_flutter/repository/talla/talla_repository.dart';
import 'package:footage_flutter/repository/talla/talla_repository_impl.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/seccion/seccion_response.dart';
import '../../repository/categoria/categoria_repository_impl.dart';
import 'menu.dart';

class VenderScreen extends StatefulWidget {

  const VenderScreen({ Key? key }) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<VenderScreen> {
  String imageSelect = "Imagen no selecionada";
  FilePickerResult? result;
  PlatformFile? file;
  late ProductoRepository productoRepository;
  late SeccionRepository seccionRepository;
  late CategoriaRepository categoriaRepository;
  late MarcaRepository marcaRepository;
  late TallaRepository tallaRepository;
  final _formKey = GlobalKey<FormState>();
  TextEditingController titulo = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  bool intercambio = false;
  bool original = false;
  double precio = 0.0;
  int usuario = 0;
  int seccion = 0;
  int categoria = 0;
  int marca = 0;
  int talla = 0;
  late Future<SharedPreferences> _prefs;
  String path = "";

  @override
  void initState() {
    productoRepository = ProductoRepositoryImpl();
    seccionRepository = SeccionRepositoryImpl();
    categoriaRepository = CategoriaRepositoryImpl();
    marcaRepository = MarcaRepositoryImpl();
    tallaRepository = TallaRepositoryImpl();
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
              return ProductoBloc(productoRepository);
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
    String selectedValueSeccion = '';
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
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1, bottom: MediaQuery.of(context).size.height*0.1),
                  child: BlocConsumer<ImageBloc, ImageState>(
                    listenWhen: (context, state) {return state is ImageSelectedSuccessState;},
                    listener: (context, state) {},
                    buildWhen: (context, state) {return state is ImageInitial || state is ImageSelectedSuccessState;},
                    builder: (context, state) {
                      if (state is ImageSelectedSuccessState) {
                        path = state.pickedFile.path;
                        // ignore: avoid_print
                        print('PATH ${state.pickedFile.path}');
                        return Column(children: [
                          Image.file(
                            File(state.pickedFile.path),
                            height: 100,
                          ),
                        ]);
                      }
                      return Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colores.blanco,
                            fixedSize: const Size(200, 40),
                            side: const BorderSide(color: Colores.principal, width: 2)
                          ),
                          onPressed: () {BlocProvider.of<ImageBloc>(context).add(const SelectImageEvent(ImageSource.gallery));},
                          child: const Text('Seleccionar Imagen', style: TextStyle(color: Colores.principal,))
                        )
                      );
                    }
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
                        labelText: 'T??tulo',
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
                        labelText: 'Descripci??n',
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
                      items: dropdownSeccion,
                      decoration: const InputDecoration(
                        labelText: "Secci??n",
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
                        labelText: "Categor??a",
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
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                      controller: TextEditingController(text: precio.toString()),
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
                              intercambio: intercambio,
                              original: original,
                              usuario: usuario,
                              seccion: seccion,
                              categoria: categoria,
                              marca: marca,
                              talla: talla,
                              estado: selectedValueEstado
                            );
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
                    child: const Text("Un vendedor profesional simulando ser un consumidor o usuario no profesional en Footage incurrir?? en las sanciones previstas en los art??culos 49 y subsiguientes del Real Decreto Legislativo 1/2007.", style: TextStyle(fontSize: 14, color: Colores.gris)),
                  ),
                ),
              ],
            ),
          )
        ),
      );
  }
  
  List<DropdownMenuItem<String>> get dropdownSeccion{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text(""),value: ""),
      const DropdownMenuItem(child: Text("Hombre"),value: "Hombre"),
      const DropdownMenuItem(child: Text("Mujer"),value: "Mujer"),
      const DropdownMenuItem(child: Text("Ni??o"),value: "Ni??o"),
      const DropdownMenuItem(child: Text("Unisex"),value: "Unisex"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownCategoria{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text(""),value: ""),
      const DropdownMenuItem(child: Text("Camisetas"),value: "Camisetas"),
      const DropdownMenuItem(child: Text("Shorts"),value: "Shorts"),
      const DropdownMenuItem(child: Text("Lifestyle"),value: "Lifestyle"),
      const DropdownMenuItem(child: Text("Accesorios"),value: "Accesorios"),
      const DropdownMenuItem(child: Text("Balones"),value: "Balones"),
      const DropdownMenuItem(child: Text("Banderas"),value: "Banderas"),
      const DropdownMenuItem(child: Text("Botas"),value: "Botas"),
      const DropdownMenuItem(child: Text("Bufandas"),value: "Bufandas"),
      const DropdownMenuItem(child: Text("Banderas"),value: "Banderas"),
      const DropdownMenuItem(child: Text("Cromos"),value: "Cromos"),
      const DropdownMenuItem(child: Text("Otra"),value: "Otra"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownMarca{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text(""),value: ""),
      const DropdownMenuItem(child: Text("Nike"),value: "Nike"),
      const DropdownMenuItem(child: Text("Adidas"),value: "Adidas"),
      const DropdownMenuItem(child: Text("Kappa"),value: "Kappa"),
      const DropdownMenuItem(child: Text("Umbro"),value: "Umbro"),
      const DropdownMenuItem(child: Text("Puma"),value: "Puma"),
      const DropdownMenuItem(child: Text("Errea"),value: "Errea"),
      const DropdownMenuItem(child: Text("Hummel"),value: "Hummel"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownTalla{
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text(""),value: ""),
      const DropdownMenuItem(child: Text("XS"),value: "XS"),
      const DropdownMenuItem(child: Text("S"),value: "S"),
      const DropdownMenuItem(child: Text("M"),value: "M"),
      const DropdownMenuItem(child: Text("L"),value: "L"),
      const DropdownMenuItem(child: Text("XL"),value: "XL"),
      const DropdownMenuItem(child: Text("XXL"),value: "XXL"),
      const DropdownMenuItem(child: Text("XXXL"),value: "XXXL"),
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

}