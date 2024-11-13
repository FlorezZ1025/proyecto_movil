import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/providers/cart_provider.dart';
import 'package:rappi_u/providers/shop_provider.dart';
import '../mocks/data.dart';
import '../utils/colors.dart';
import '../widgets/store_card.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> tiendas = Data.foodIcons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lastOrders = ref.watch(cartProvider.notifier).getLastOrder();
    final shopAsyncValue = ref.watch(shopProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  context.push('/home');
                });
          },
        ),
        title: const Text('RappiU'),
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
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            child: FutureBuilder(
              future: lastOrders,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('Error al cargar pedidos anteriores.'));
                } else if (snapshot.data == null || snapshot.data == []) {
                  return const Center(
                      child: Text('No hay pedidos anteriores.'));
                } else {
                  final products = snapshot.data!;
                  return GridView.builder(
                      itemCount: products.length > 6 ? 6 : products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            product['imageUrl'],
                            width: 70,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        );
                      });
                }
              },
            ),
          ),
        ]),
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
