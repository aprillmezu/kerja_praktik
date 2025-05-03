import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Import screens
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/product_list_screen.dart';
import 'screens/product_form_screen.dart';

// Import model
import 'models/product_model.dart';

// Firebase options (jika perlu)
import 'firebase_options.dart'; // <- Ini tergantung dari setup kamu via FlutterFire CLI

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Penjualan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: AppBarTheme(
          elevation: 1,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
      home: AuthWrapper(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/': (context) => ProductListScreen(),
        '/add-product': (context) => ProductFormScreen(),
        '/edit-product': (context) {
          final product = ModalRoute.of(context)!.settings.arguments as Product;
          return ProductFormScreen(product: product);
        },
        // Tambahkan lainnya seperti '/transaksi': ... jika perlu
      },
    );
  }
}

// Wrapper untuk arahkan user ke login atau dashboard
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return const Center(child: CircularProgressIndicator());

        if (snapshot.hasData) {
          return DashboardScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
