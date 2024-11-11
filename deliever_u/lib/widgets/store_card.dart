import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StoreCard extends StatelessWidget {
  final String shopName;
  final String description;
  final String image; 

  const StoreCard({super.key, 
    required this.shopName,
    required this.description,
    required this.image,
  });
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(
            image,
            width: 90,
            height: 70,
            fit: BoxFit.cover,)),
        title: Text(shopName),
        subtitle: Text(description),
        onTap: () {
          context.push('/store');
        },
      ),
    );
  }
}
