import 'package:flutter/material.dart';
import 'package:footage_flutter/ui/screens/inicio_screen.dart';

class DetalleProducto extends StatelessWidget {

  const DetalleProducto({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/camiseta.jpg"),
                    fit: BoxFit.cover,
                  )
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const Inicio()));}, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.favorite_border, color: Colors.white,),
                    )
                  ],
                ),
              )
            ],
          )
        )
      )
    );
  }
  
}