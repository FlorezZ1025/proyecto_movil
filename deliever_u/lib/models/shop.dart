class Shop{
  final String name;
  final String description;
  final String imageUrl;

  Shop({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  // Constructor para crear una instancia a partir de un mapa de datos
  factory Shop.fromMap(Map<String, dynamic> map) {
    return Shop(
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['image_url'] as String,
    );
  }
}
