class CartItem {
  final int productId;
  final String imageUrl;
  final String name;
  final int price;
  int quantity;

  CartItem({
    required this.productId,
    required this.imageUrl,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
  int get totalPrice => price * quantity;

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'],
      imageUrl: map['imageUrl'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'imageUrl': imageUrl,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

}