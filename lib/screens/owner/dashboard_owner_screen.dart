import 'package:flutter/material.dart';

class DashboardOwnerScreen extends StatelessWidget {
  const DashboardOwnerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard Owner')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Selamat Datang, Owner!', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Laporan Penjualan dan Kinerja Perusahaan.'),
          ],
        ),
      ),
    );
  }
}
