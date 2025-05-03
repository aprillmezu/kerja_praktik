import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/transaction_model.dart';
import '../models/transaction_model.dart';

class TransactionService {
  final String baseUrl = 'https://example.com/api/transactions'; // Ganti dengan API kamu

  Future<List<TransactionModel>> getUserTransactions(String userId) async {
    final response = await http.get(Uri.parse('$baseUrl/user/$userId'));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => TransactionModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal mengambil transaksi');
    }
  }

  Future<void> createTransaction(TransactionModel transaction) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(transaction.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Gagal membuat transaksi');
    }
  }

  Future<void> updateTransactionStatus(String id, String status) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'status': status}),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memperbarui status transaksi');
    }
  }
}
