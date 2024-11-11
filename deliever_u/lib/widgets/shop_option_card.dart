import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreOptionCard extends StatelessWidget {
  final String shopName;
  final String description;
  final String image;

  const StoreOptionCard({
    super.key,
    required this.shopName,
    required this.description,
    required this.image,
  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
        child: Column(
          children: [
              const Icon(Icons.store),

            ListTile(
              //TO DO: Agregar la imagen de la tienda
              title: Text(shopName),
              subtitle: Text(description),
              onTap: () {
                context.push('/store');
              },
            ),
          ],
        ),
    );
  }
}
