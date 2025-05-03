class TransactionModel {
  final String id;
  final String userId;
  final String productId;
  final DateTime date;
  final TransactionType type; // jual atau sewa
  final double totalPrice;
  final String status;
  final DateTime? rentalStart;
  final DateTime? rentalEnd;

  TransactionModel({
    required this.id,
    required this.userId,
    required this.productId,
    required this.date,
    required this.type,
    required this.totalPrice,
    required this.status,
    this.rentalStart,
    this.rentalEnd,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      userId: json['userId'],
      productId: json['productId'],
      date: DateTime.parse(json['date']),
      type: TransactionTypeExtension.fromString(json['type']),
      totalPrice: json['totalPrice'].toDouble(),
      status: json['status'],
      rentalStart: json['rentalStart'] != null
          ? DateTime.parse(json['rentalStart'])
          : null,
      rentalEnd: json['rentalEnd'] != null
          ? DateTime.parse(json['rentalEnd'])
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'productId': productId,
    'date': date.toIso8601String(),
    'type': type.name,
    'totalPrice': totalPrice,
    'status': status,
    'rentalStart': rentalStart?.toIso8601String(),
    'rentalEnd': rentalEnd?.toIso8601String(),
  };
}

enum TransactionType { jual, sewa }

extension TransactionTypeExtension on TransactionType {
  static TransactionType fromString(String type) {
    switch (type.toLowerCase()) {
      case 'jual':
        return TransactionType.jual;
      case 'sewa':
        return TransactionType.sewa;
      default:
        throw Exception('Unknown transaction type');
    }
  }

  String get name {
    switch (this) {
      case TransactionType.jual:
        return 'jual';
      case TransactionType.sewa:
        return 'sewa';
    }
  }
}
