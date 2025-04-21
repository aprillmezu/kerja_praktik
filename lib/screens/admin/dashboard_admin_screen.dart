import 'package:flutter/material.dart';

class DashboardAdminScreen extends StatelessWidget {
  const DashboardAdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Admin')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Selamat Datang, Admin!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Manajemen Produk, Transaksi, dan Data Pelanggan.'),
          ],
        ),
      ),
    );
  }
}
