import 'package:flutter/material.dart';
import 'package:kerja_praktik/models/product_model.dart';
import 'package:kerja_praktik/service/auth_services.dart';
import '../admin/admin_product_screen.dart';
import '../customer/customer_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;
  String? errorMsg;

  void handleLogin() async {
    setState(() {
      isLoading = true;
      errorMsg = null;
    });

    try {
      final user = await authService.login(
        emailController.text,
        passwordController.text,
      );

      Widget targetScreen;
      switch (user.role) {
        case UserRole.admin:
          targetScreen = const AdminProductScreen();
          break;
        case UserRole.customer:
          targetScreen = const CustomerHomeScreen();
          break;
        case UserRole.owner:
          targetScreen = const Placeholder(); // Buatkan jika perlu
          break;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => targetScreen),
      );
    } catch (e) {
      setState(() {
        errorMsg = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        Column(
          children: [
            if (errorMsg != null)
              Text(errorMsg!, style: const TextStyle(color: Colors.red)),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
              onPressed: handleLogin,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
// TODO Implement this library.