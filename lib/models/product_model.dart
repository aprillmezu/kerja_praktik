class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double rentalPrice;
  final bool isAvailable;
  final ProductType type; // jual atau sewa
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.rentalPrice,
    required this.isAvailable,
    required this.type,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      rentalPrice: json['rentalPrice'].toDouble(),
      isAvailable: json['isAvailable'],
      type: ProductTypeExtension.fromString(json['type']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'rentalPrice': rentalPrice,
    'isAvailable': isAvailable,
    'type': type.name,
    'imageUrl': imageUrl,
  };
}

enum ProductType { jual, sewa }

extension ProductTypeExtension on ProductType {
  static ProductType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'jual':
        return ProductType.jual;
      case 'sewa':
        return ProductType.sewa;
      default:
        throw Exception('Unknown product type');
    }
  }

  String get name {
    switch (this) {
      case ProductType.jual:
        return 'jual';
      case ProductType.sewa:
        return 'sewa';
    }
  }
}
