import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pedido'),
        ),
        body: Column(
          children: [
            const Text('Especifica tu ubicación', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 10.0, 
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 40.0, horizontal: 10.0),
              ),
            )
          ],
        ));
  }
}
