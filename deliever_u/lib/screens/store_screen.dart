import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/providers/product_provider.dart';
import 'package:rappi_u/providers/shop_provider.dart';
import 'package:rappi_u/utils/colors.dart';
import 'package:rappi_u/widgets/product_card.dart';

class StoreScreen extends ConsumerStatefulWidget {
  final int idShop;

  const StoreScreen({super.key, required this.idShop});

  @override
  ConsumerState<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends ConsumerState<StoreScreen> {

 

  @override
  Widget build(BuildContext context) {
    final shopAsyncValue = ref.watch(shopProvider);

    final productAsyncValue =
        ref.watch(productProvider(widget.idShop.toString()));

    return Scaffold(
      appBar: AppBar(
        title: shopAsyncValue.when(data: (shops) {
          final shop =
              shops.firstWhere((element) => element.idShop == widget.idShop);
          return Text(shop.name);
        }, error: (Object error, StackTrace stackTrace) {
          return const Text('Error');
        }, loading: () {
          return const Text('Cargando...');
        }),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              context.push('/cart');
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
          Center(
            child: Card(
              color: AppColors.blueShade1,
              child: ClipRRect(
                  child: shopAsyncValue.when(
                data: (shops) {
                  final shop = shops
                      .firstWhere((element) => element.idShop == widget.idShop);
                  return Image.network(
                    shop.imageUrl,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                },
                error: (Object error, StackTrace stackTrace) {
                  return const Text('Error');
                },
                loading: () {
                  return const CircularProgressIndicator();
                },
              )),
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
              child: productAsyncValue.when(
            data: (products) => ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                      productId: product.id,
                      name: product.name,
                      imageUrl: product.imageUrl,
                      price: product.price,
                );
              },
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          ))
        ],
      ),
    );
  }
}
