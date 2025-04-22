import 'package:flutter/material.dart';
import 'package:kerja_praktik/screens/admin/dashboard_admin_screen.dart';
import 'package:kerja_praktik/screens/customer/home_customer_screen.dart';
import 'package:kerja_praktik/screens/login_screen.dart';
import 'package:kerja_praktik/screens/owner/dashboard_owner_screen.dart';
import 'package:kerja_praktik/screens/auth/login_screen.dart';
import 'package:sistem_penjualan/screens/auth/register_screen.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistem Penjualan',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/admin': (context) => const DashboardAdminScreen(),
        '/customer': (context) => HomeCustomerScreen(),
        '/owner': (context) => const DashboardOwnerScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
