import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/models/cart_item.dart';
import 'package:rappi_u/providers/cart_provider.dart';

class ProductCard extends ConsumerWidget {
  final int productId;
  final String name;
  final String imageUrl;
  final int price;

  const ProductCard({
    super.key,
    required this.productId,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final cartItem = cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartItem(
        productId: productId,
        imageUrl: imageUrl,
        name: name,
        price: price,
        quantity: 0,
      ),
    );

    return Card(
      child: ListTile(
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.network(
              imageUrl,
              width: 90,
              height: 70,
              fit: BoxFit.cover,
            )),
        title: Text(name),
        subtitle: Text('Precio: \$ $price'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: cartItem.quantity > 0
                  ? () {
                      //descontar uno
                      if (cartItem.quantity > 1) {
                        ref
                            .read(cartProvider.notifier)
                            .updateQuantity(productId, cartItem.quantity - 1);
                      } else {
                        ref.read(cartProvider.notifier).removeProduct(cartItem);
                      }
                    }
                  : null,
            ),
            Text('${cartItem.quantity}'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                //aumentar uno
                final newCartItem = CartItem(productId: productId, imageUrl: imageUrl, name: name, price: price);
                ref.read(cartProvider.notifier).addProduct(newCartItem);
              },
            ),
          ],
        ),
      ),
    );
  }
}
