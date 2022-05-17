import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/menu_screen.dart';
import 'package:footage_flutter/ui/screens/perfil_screen.dart';

class DetalleProducto extends StatelessWidget {
  const DetalleProducto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/camiseta.jpg"),
                  fit: BoxFit.cover,
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Menu()));},
                      icon: const Icon(Icons.arrow_back, color: Colors.white)
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border, color: Colors.white)
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white, fixedSize: const Size(320, 40)),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const Perfil()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: const Image(
                            image: AssetImage("assets/images/icono.png"),
                            width: 30,
                          )
                        )
                      ),
                      const Text("danieloliva20", style: TextStyle(fontSize: 15, color: Colors.black)),
                      const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      )
                    ],
                  )
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:(MediaQuery.of(context).size.height*0.05), left:(MediaQuery.of(context).size.width*0.08)),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: const [
                      Text("Camiseta Real Betis temporada 95/97", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Camiseta Real Betis temporada 95/97", style: TextStyle(fontSize: 18, color: Colors.grey))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
