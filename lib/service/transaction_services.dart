// lib/models/transaction_model.dart

class TransactionModel {
  final int? id;
  final int userId;
  final String productName;
  final int quantity;
  final double totalPrice;
  final DateTime transactionDate;

  TransactionModel({
    this.id,
    required this.userId,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
    required this.transactionDate,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'],
      userId: json['userId'],
      productName: json['productName'],
      quantity: json['quantity'],
      totalPrice: json['totalPrice'].toDouble(),
      transactionDate: DateTime.parse(json['transactionDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productName': productName,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'transactionDate': transactionDate.toIso8601String(),
    };
  }
}
