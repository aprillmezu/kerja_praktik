class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String category;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.category,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['name'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      stock: json['stock'],
      category: json['category'],
      imageUrl: json['image_url'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'stock': stock,
    'category': category,
    'image_url': imageUrl,
  };
}
