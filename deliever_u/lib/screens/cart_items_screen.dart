import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/providers/cart_provider.dart';

class CartItemsScreen extends ConsumerWidget {
  const CartItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Carrito')),
      body: cartItems.isEmpty
          ? const Center(child: Text('El carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text('Cantidad: ${item.quantity}'),
                        trailing: Text('\$${item.totalPrice}'),
                        leading: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            if (item.quantity > 1) {
                              ref.read(cartProvider.notifier).updateQuantity(
                                  item.productId, item.quantity - 1);
                            } else {
                              ref
                                  .read(cartProvider.notifier)
                                  .removeProduct(item);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text('Total: \$${cartNotifier.totalPrice}'),
                ),
         
              ],
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          
          onPressed: () async {
            if (cartItems.isEmpty) {
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("El carrito está vacío")),
              );
              return;
            }
            await ref.read(cartProvider.notifier).completeOrder();
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Pedido realizado con éxito!")),
            );
          },
          
          child: const Text("Realizar pedido"),
        ),
      ),
    );
  }
}
