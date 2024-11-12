import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;

  const ProductCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              imageUrl,
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            )),
        title: Text(name),
        subtitle: Text('Precio: \$ $price'),
      ),
    );
  }
}
