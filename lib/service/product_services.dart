class ProductModel {
  final int? id;
  final String name;
  final String description;
  final double price;
  final int stock;

  ProductModel({
    this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.stock,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'],
    name: json['name'],
    description: json['description'],
    price: json['price'].toDouble(),
    stock: json['stock'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'price': price,
    'stock': stock,
  };
}
