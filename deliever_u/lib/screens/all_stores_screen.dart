import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/providers/shop_provider.dart';
import 'package:rappi_u/widgets/shop_option_card.dart';
import '../mocks/data.dart';
import '../utils/colors.dart';

class AllStoresScreen extends ConsumerWidget {
  final List<Map<String, String>> stores = Data.stores;

  AllStoresScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopAsyncValue = ref.watch(shopProvider);

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
              decoration: InputDecoration(
                  labelText: 'Buscar por nombre', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 16.0),
            Expanded(
                child: shopAsyncValue.when(
              data: (shops) => GridView.builder(
                itemCount: shops.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Número de columnas
                  // childAspectRatio:
                  //     7/5, // Proporción del ancho/alto de cada ítem
                  crossAxisSpacing: 2, // Espacio entre columnas
                  mainAxisSpacing: 2, // Espacio entre filas
                ),
                itemBuilder: (context, index) {
                  final shop = shops[index];
                  return StoreOptionCard(
                    shopName: shop.name,
                    description: shop.description,
                    image: shop.imageUrl,
                  );
                },
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stackTrace) => Center(
                child: Text('Error: $error'),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
