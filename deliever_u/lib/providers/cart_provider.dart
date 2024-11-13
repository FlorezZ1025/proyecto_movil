import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/models/cart_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                imageUrl: state[i].imageUrl,
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
            imageUrl: item.imageUrl,
            name: item.name,
            price: item.price,
            quantity: quantity,
          )
        else
          item
    ];
  }

  int get totalPrice =>
      state.fold(0, (total, current) => total + current.totalPrice);

  Future<void> completeOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> orderItems = state
        .map((item) => {
              'productId': item.productId,
              'imageUrl': item.imageUrl,
              'name': item.name,
              'price': item.price,
              'quantity': item.quantity,
            })
        .toList();
    await prefs.setString('lastOrder', jsonEncode(orderItems));

    state = [];
  }

  Future<List<Map<String, dynamic>>> getLastOrder() async {
    final prefs = await SharedPreferences.getInstance();
    final lastOrder = prefs.getString('lastOrder');
    if (lastOrder != null) {
      return List<Map<String, dynamic>>.from(jsonDecode(lastOrder));
    }
    return [];
  }

  Future<void> loadCartFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('lastOrder');
    if (cartData != null) {
      final List<dynamic> decodedData = jsonDecode(cartData);
      state = decodedData.map((item) => CartItem.fromMap(item)).toList();
    }
  }

  Future<void> saveCartToPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = jsonEncode(state.map((item) => item.toMap()).toList());
    prefs.setString('lastOrder', cartData);
  }
}

final cartProvider = StateNotifierProvider<CartProvider, List<CartItem>>((ref) {
  final cartProvider = CartProvider();
  return cartProvider;
});
