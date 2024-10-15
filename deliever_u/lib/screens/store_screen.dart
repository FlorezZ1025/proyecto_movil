import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/utils/colors.dart';

class StoreScreen extends StatefulWidget {
  StoreScreen({super.key});

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  // Lista para almacenar los productos añadidos al carrito
  final List<String> _cart = [];

  // Función para añadir productos al carrito
  void _addToCart(String product) {
    setState(() {
      _cart.add(product); // Añadir producto al carrito
    });

    // Mostrar un mensaje confirmando que el producto fue añadido al carrito
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$product añadido al carrito'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donde Tavo'),
        actions: [
          // Ícono para ver el carrito
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(_cart[index]),
                      );
                    },
                  );
                },
              );
            },
          ),
          IconButton(
              onPressed: () {
                context.push('/order');
              },
              icon: const Icon(Icons.abc_rounded))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          const Center(
            child: Card(
              color: AppColors.blueShade1,
              child: ClipRRect(
                child: Icon(
                  Icons.store,
                  size: 130.0,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          const Center(
            child: Text(
              'Productos Disponibles',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16.0),
          Expanded(
            child: GridView.builder(
              itemCount: 20, // Cantidad de productos disponibles
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Número de columnas
                childAspectRatio:
                    4 / 3, // Proporción del ancho/alto de cada ítem
                crossAxisSpacing: 2, // Espacio entre columnas
                mainAxisSpacing: 2, // Espacio entre filas
              ),
              itemBuilder: (context, index) {
                // Nombre del producto simulado
                String productName = 'Producto $index';

                return GestureDetector(
                  onTap: () {
                    // Llama a la función para añadir el producto al carrito
                    _addToCart(productName);
                  },
                  child: Column(
                    children: [
                      const Icon(Icons.fastfood, size: 50),
                      Text(productName),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
