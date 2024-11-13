import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/models/cart_item.dart';

class CartProvider extends StateNotifier<List<CartItem>> {
  CartProvider() : super([]);

  void addProduct(CartItem cartItem) {
    final index =
        state.indexWhere((element) => element.productId == cartItem.productId);
    if (index != -1) {
      state = [
        for (int i = 0; i < state.length; i++)
          if (i == index)
            CartItem(
                productId: state[i].productId,
                name: state[i].name,
                price: state[i].price,
                quantity: state[i].quantity + 1)
          else
            state[i]
      ];
    } else {
      state = [...state, cartItem];
    }
  } 

  void removeProduct(CartItem cartItem) {
    state =
        state.where((item) => item.productId != cartItem.productId).toList();
  }

  void updateQuantity(int productId, int quantity) {
    state = [
      for (final item in state)
        if (item.productId == productId)
          CartItem(
            productId: item.productId,
            name: item.name,
            price: item.price,
            quantity: quantity,
          )
        else
          item
    ];
  }

  void clearCart() {
    state.clear();
    state = List.from(state);
  }
  int get totalPrice => state.fold(0, (total, current) => total + current.totalPrice);
}

 final cartProvider = StateNotifierProvider<CartProvider, List<CartItem>>(
      (ref) => CartProvider()); 