class Inventory {
  final String id;
  final String productId;
  final String status; // 'tersedia', 'disewa'
  final int quantity;

  Inventory({
    required this.id,
    required this.productId,
    required this.status,
    required this.quantity,
  });

  factory Inventory.fromJson(Map<String, dynamic> json) {
    return Inventory(
      id: json['id'].toString(),
      productId: json['product_id'].toString(),
      status: json['status'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'product_id': productId,
    'status': status,
    'quantity': quantity,
  };
}
