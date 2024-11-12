class Shop{
  final int idShop;
  final String name;
  final String description;
  final String imageUrl;

  Shop({
    required this.idShop,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      idShop: map['id_shop'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['image_url'] as String,
    );
  }
}
