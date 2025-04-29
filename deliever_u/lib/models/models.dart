class Product {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final String restaurantId;
  final String restaurantName;
  Map<String, bool> extras;

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
    required this.restaurantId,
    required this.restaurantName,
    this.extras = const {},
  });

  Product copyWith({Map<String, bool>? extras}) {
    return Product(
      id: id,
      name: name,
      imagePath: imagePath,
      price: price,
      restaurantId: restaurantId,
      restaurantName: restaurantName,
      extras: extras ?? this.extras,
    );
  }
}

class NewCartItem {
  final Product product;
  final int quantity;
  final String? observations;

  NewCartItem({
    required this.product,
    this.quantity = 1,
    this.observations,
  });

  double get total => product.price * quantity;

  NewCartItem copyWith({
    int? quantity,
    String? observations,
  }) {
    return NewCartItem(
      product: product,
      quantity: quantity ?? this.quantity,
      observations: observations ?? this.observations,
    );
  }
}

class Cart {
  final List<NewCartItem> items;
  final String? restaurantId;

  Cart({
    this.items = const [],
    this.restaurantId,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.total);

  double get deliveryFee => 2000.0; //
  double get tax => subtotal * 0.08; //
  double get total => subtotal + deliveryFee + tax;

  Cart copyWith({
    List<NewCartItem>? items,
    String? restaurantId,
  }) {
    return Cart(
      items: items ?? this.items,
      restaurantId: restaurantId ?? this.restaurantId,
    );
  }
}

enum OrderStatus {
  processing,
  preparing,
  onTheWayToRestaurant,
  pickedUp,
  onTheWayToYou,
  delivered
}

class Order {
  final String id;
  final List<NewCartItem> items;
  final DateTime orderTime;
  OrderStatus status;
  final String restaurantId;
  final String restaurantName;

  Order({
    required this.id,
    required this.items,
    required this.orderTime,
    this.status = OrderStatus.processing,
    required this.restaurantId,
    required this.restaurantName,
  });
}