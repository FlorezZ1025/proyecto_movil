import 'package:flutter/material.dart';
import '../widgets/store_card.dart';
import '../utils/colors.dart';


class AllStoresScreen extends StatelessWidget {
  
  final List<Map<String, String>> stores = [
    {
      'storeName': 'Cafetería Central',
      'description': 'Comida y bebidas',
      'image': '',
    },
    {
      'storeName': 'Librería Campus',
      'description': 'Libros y útiles',
      'image': '',
    },
    {
      'storeName': 'Tienda Universitaria',
      'description': 'Ropa y accesorios',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
   
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
   
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
   
    {
      'storeName': 'Pizzería Don Pepe',
      'description': 'Pizzas y pastas',
      'image': '',
    },
   
  ];

  AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiendas Disponibles', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500),),
        backgroundColor: WidgetStateColor.transparent,
      ),
      backgroundColor: AppColors.secondaryColor,
      
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: stores.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Número de columnas
            childAspectRatio: 3 / 2, // Proporción del ancho/alto de cada ítem
            crossAxisSpacing: 2, // Espacio entre columnas
            mainAxisSpacing: 2, // Espacio entre filas
          ),
          itemBuilder: (context, index) {
            final store = stores[index];
            return StoreCard(
              storeName: store['storeName']!,
              description: store['description']!, 
              image: '',
          
            );
          },
        ),
      ),
    );
  }
}
