import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pedido'),
        ),
        body: Column(
          children: [
            Text('Especifica tu ubicación'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0), // Bordes redondeados
                  borderSide: const BorderSide(
                    color: Colors.black, // Color del borde
                    width: 10.0, // Grosor del borde
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0), // Aumentar la altura
              ),
            )
          ],
        ));
  }
}
