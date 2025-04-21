class Transaction {
  final String id;
  final String userId;
  final String date;
  final double total;
  final List<Map<String, dynamic>> items;

  Transaction({
    required this.id,
    required this.userId,
    required this.date,
    required this.total,
    required this.items,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      userId: json['user_id'],
      date: json['date'],
      total: double.tryParse(json['total'].toString()) ?? 0.0,
      items: List<Map<String, dynamic>>.from(json['items']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'date': date,
    'total': total,
    'items': items,
  };
}
