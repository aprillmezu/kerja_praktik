import 'package:flutter/material.dart';
import 'screen/admin/admin_product_screen.dart';
import 'screen/customer/customer_home_screen.dart';
import 'package:kerja_praktik/screen/auth/login_screen.dart';
import 'screen/auth/login_screen.dart';

void main() {
  runApp(const AlatUkurApp());
}

class AlatUkurApp extends StatelessWidget {
  const AlatUkurApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Penjualan & Penyewaan Alat Ukur',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginScreen(),

      // Named routes opsional (bisa dipakai jika ingin navigasi pakai nama)
      routes: {
        '/login': (_) => const LoginScreen(),
        '/admin': (_) => const AdminProductScreen(),
        '/customer': (_) => const CustomerHomeScreen(),
        // '/owner': (_) => const OwnerDashboardScreen(), // Buat jika diperlukan
      },
    );
  }
}
