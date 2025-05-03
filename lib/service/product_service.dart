import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/product_model.dart';
import '../models/product_model.dart';

class ProductService {
  final String baseUrl = 'https://example.com/api/products'; // Ganti dengan API kamu

  Future<List<ProductModel>> getAllProducts() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => ProductModel.fromJson(item)).toList();
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }

  Future<ProductModel> getProductById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return ProductModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Gagal mengambil data produk');
    }
  }

  Future<void> createProduct(ProductModel product) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Gagal menambahkan produk');
    }
  }

  Future<void> updateProduct(String id, ProductModel product) async {
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Gagal memperbarui produk');
    }
  }

  Future<void> deleteProduct(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus produk');
    }
  }
}
// TODO Implement this library.