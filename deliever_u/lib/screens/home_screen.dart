import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/providers/shop_provider.dart';
import '../mocks/data.dart';
import '../utils/colors.dart';
import '../widgets/store_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> tiendas = Data.foodIcons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopAsyncValue = ref.watch(shopProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  context.push('/');
                });
          },
        ),
        title: const Text('DelieverU'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              context.push('/profile');
            },
          )
        ],
      ),
      backgroundColor: AppColors.tertiaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tiendas Recomendadas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: shopAsyncValue.when(
                  data: (shops) => ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        final shop = shops[index];
                        return StoreCard(
                          idShop: shop.idShop,
                          shopName: shop.name,
                          description: shop.description,
                          image: shop.imageUrl,
                        );
                      }),
                  error: (error, stackTrace) => Center(
                        child: Text('Error: $error'),
                      ),
                  loading: () => const Center(
                        child: CircularProgressIndicator(),
                      )),
            ),
            const SizedBox(height: 10),
            Center(
                child: TextButton(
                    onPressed: () {
                      context.push('/stores');
                    },
                    child: const Text('Ver todas las tiendas'))),
            const Text(
              'Historial de Pedidos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: tiendas.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 columnas
                  childAspectRatio: 1, // Proporción cuadrada
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final foodItem = tiendas[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        foodItem['icon'],
                        size: 50,
                        color: AppColors.red, // Color del ícono
                      ),
                      const SizedBox(height: 5),
                      Text(foodItem['label']),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/cart');
        },
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
