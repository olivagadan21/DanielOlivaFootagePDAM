import 'package:flutter/material.dart';
import 'package:footage_flutter/models/map/map.dart';
import 'package:footage_flutter/style/styles.dart';
import 'package:footage_flutter/ui/screens/editar_perfil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

LatLng latlong = const LatLng(40.463667, -3.74922);

const CameraPosition _kInitialPosition =
    CameraPosition(target: LatLng(40.463667, -3.74922), zoom: 5.2);

class MapClickPage extends GoogleMapExampleAppPage {
  const MapClickPage() : super(const Icon(Icons.mouse), 'Map click');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.04),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const EditarPerfil()));}, icon: const Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.01),
                  child: Container(
                    color: Colores.gris,
                    width: MediaQuery.of(context).size.width,
                    height: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.06, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: const Text("Seleccione su ubicación.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.04, left: MediaQuery.of(context).size.width*0.05, right: MediaQuery.of(context).size.width*0.05),
                  child: const _MapClickBody(),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05, left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                  child: Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colores.principal,
                            fixedSize: Size(MediaQuery.of(context).size.width, 40)),
                        onPressed: () {},
                        child: const Text(
                          "Guardar",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colores.blanco),
                        )),
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class _MapClickBody extends StatefulWidget {
  const _MapClickBody();
  @override
  State<StatefulWidget> createState() => _MapClickBodyState();
}

class _MapClickBodyState extends State<_MapClickBody> {
  _MapClickBodyState();
  GoogleMapController? mapController;
  @override
  Widget build(BuildContext context) {
    final GoogleMap googleMap = GoogleMap(
      markers: <Marker>{
        _createMarker()
      },
      onMapCreated: onMapCreated,
      initialCameraPosition: _kInitialPosition,
      onTap: (LatLng pos) {
        setState(() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setDouble('lat', pos.latitude);
          prefs.setDouble('lng', pos.longitude);
          setState(() {
            latlong=pos;
          });
        });
      },
      onLongPress: (LatLng pos) {
        setState(() async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setDouble('lat', pos.latitude);
          prefs.setDouble('lng', pos.longitude);
        });
      },
    );
    final List<Widget> columnChildren = <Widget>[
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.55,
            child: googleMap,
          ),
        ),
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );
  }

  void onMapCreated(GoogleMapController controller) async {
    setState(() {
      mapController = controller;
    });
  }

  Marker _createMarker() {
      return Marker(
        markerId: const MarkerId("marker_1"),
        position: latlong,
      );
  }
}
