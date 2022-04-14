import 'package:flutter/material.dart';

class Principal extends StatelessWidget {

  const Principal({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/principal.jpg")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  
}