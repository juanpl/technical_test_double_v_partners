import 'package:flutter/material.dart';


class CustomLoadingView extends StatelessWidget {
  const CustomLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.blue)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 50, // Ancho del spinner
                  height: 50, 
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    strokeWidth: 5,
                     // Grosor de la línea
                  ),
                ),
                Text('Cargando...', style: TextStyle(color: Colors.blue, fontSize: 16),)
              ],
            ),
          ),
        ),  
      );
  }
}