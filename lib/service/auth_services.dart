import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kerja_praktik/models/user_model.dart';

class AuthService {
  final String loginUrl = 'https://example.com/api/login'; // Ganti sesuai API

  Future<UserModel> login(String email, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return UserModel.fromJson(jsonData['user']);
    } else {
      throw Exception('Login gagal');
    }
  }
}
// TODO Implement this library.