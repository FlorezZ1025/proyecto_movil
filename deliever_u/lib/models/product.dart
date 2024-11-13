class Product {
  final int id;
  final String name;
  final String imageUrl;
  final int price;
  final int shopId;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.shopId,
  });
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id_product'],
      name: map['name'],
      imageUrl: map['image'],
      price: map['price'],
      shopId: map['id_shop'],
    );
  }
}
