import 'package:flutter/material.dart';
import '../mocks/data.dart';
import '../widgets/store_card.dart';
import '../utils/colors.dart';

class AllStoresScreen extends StatelessWidget {
  final List<Map<String, String>> stores = Data.stores;

  AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tiendas Disponibles',
          style: TextStyle(
              color: AppColors.primaryColor, fontWeight: FontWeight.w500),
        ),
        backgroundColor: WidgetStateColor.transparent,
      ),
      backgroundColor: AppColors.tertiaryColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Buscar por nombre', border: OutlineInputBorder()),
             
            ),
            const SizedBox(height: 16.0),
            Expanded(
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
          ],
        ),
      ),
    );
  }
}
