import 'package:flutter/material.dart';

class StoreCard extends StatelessWidget {
  final String storeName;
  final String description;
  final String image; 

  StoreCard({
    required this.storeName,
    required this.description,
    required this.image,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        //TO DO: Agregar la imagen de la tienda
        leading: const Icon(Icons.store),
        title: Text(storeName),
        subtitle: Text(description),
        onTap: () {
          // Lógica para ir a la pantalla de productos de la tienda
        },
      ),
    );
  }
}
