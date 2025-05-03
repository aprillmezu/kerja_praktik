import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class DashboardScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  DashboardScreen({Key? key}) : super(key: key);

  void _logout(BuildContext context) async {
    await _authService.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.getCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () => _logout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('Selamat datang, ${user?.email ?? "Pengguna"}',
              style: TextStyle(fontSize: 20)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/'),
            child: Text('Kelola Produk'),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/transaksi'),
            child: Text('Lihat Transaksi'),
          ),
        ]),
      ),
    );
  }
}
