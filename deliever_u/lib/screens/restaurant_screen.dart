import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/utils/colors.dart';
import 'product_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  final String restaurantName;
  final String specialty;

  const RestaurantScreen({
    super.key,
    required this.restaurantName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    final products = _getRestaurantProducts(restaurantName);

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurantName),
        backgroundColor: AppColors.red,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header del restaurante
          _buildRestaurantHeader(),
          const SizedBox(height: 24),
          // Lista de productos
          ...products.map((product) => _buildProductItem(context, product)).toList(),
        ],
      ),
    );
  }

  Widget _buildRestaurantHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          restaurantName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Chip(
          label: Text(specialty),
          backgroundColor: AppColors.red.withOpacity(0.2),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Icon(Icons.star, color: Colors.amber),
            SizedBox(width: 4),
            Text('4.5 (250)'),
            SizedBox(width: 16),
            Icon(Icons.access_time),
            SizedBox(width: 4),
            Text('15-25 min'),
          ],
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context, Map<String, dynamic> product) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.push('/product/${product['name']}', extra: {
            'name': product['name'],
            'imagePath': product['imagePath'],
            'price': product['price'],
            'rating': product['rating'],
            'description': product['description'],
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Imagen del producto
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  product['imagePath'],
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 80,
                    height: 80,
                    color: Colors.grey[200],
                    child: const Icon(Icons.fastfood),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Detalles del producto
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product['name'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product['description'],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '\$${product['price'].toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppColors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> _getRestaurantProducts(String restaurantName) {
    // Datos de ejemplo - deberías reemplazar con tus datos reales
    if (restaurantName == 'Tarcisio') {
      return [
        {
          'name': 'Hamburguesa Clásica',
          'imagePath': 'assets/images/burger.jpg',
          'price': 11000.0,
          'rating': '4.8 ⭐',
          'description': 'Hamburguesa con queso, lechuga y tomate',
        },
        {
          'name': 'Hamburguesa Doble',
          'imagePath': 'assets/images/double_burger.jpg',
          'price': 15000.0,
          'rating': '4.9 ⭐',
          'description': 'Doble carne con queso y tocino',
        },
        {
          'name': 'Papas Fritas',
          'imagePath': 'assets/images/fries.jpg',
          'price': 5000.0,
          'rating': '4.5 ⭐',
          'description': 'Papas fritas crujientes con salsa',
        },
      ];
    }

    // Default products
    return [
      {
        'name': 'Producto 1',
        'imagePath': 'assets/images/default.jpg',
        'price': 10000.0,
        'rating': '4.0 ⭐',
        'description': 'Descripción del producto',
      },
      {
        'name': 'Producto 2',
        'imagePath': 'assets/images/default.jpg',
        'price': 12000.0,
        'rating': '4.2 ⭐',
        'description': 'Descripción del producto',
      },
    ];
  }
}