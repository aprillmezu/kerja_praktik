import 'package:flutter/material.dart';
import 'package:kerja_praktik/screens/register_screen.dart';
import '../admin/dashboard_admin_screen.dart';
import '../customer/home_customer_screen.dart';
import '../owner/dashboard_owner_screen.dart';
import 'admin/dashboard_admin_screen.dart';
import 'customer/home_customer_screen.dart';
import 'owner/dashboard_owner_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? errorMessage;
  bool isLoading = false;

  // Akun-akun dummy
  final Map<String, Map<String, String>> dummyAccounts = {
    'admin@email.com': {
      'password': 'admin123',
      'role': 'admin',
    },
    'owner@email.com': {
      'password': 'owner123',
      'role': 'owner',
    },
    'customer@email.com': {
      'password': 'cust123',
      'role': 'customer',
    },
    'nirokky_2226240169@mhs.mdp.ac.id': {
      'password': '123456',
      'role': 'customer',
    },
  };

  void handleLogin() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    await Future.delayed(const Duration(seconds: 1));

    final email = emailController.text.trim();
    final password = passwordController.text;

    final user = dummyAccounts[email];

    if (user != null && user['password'] == password) {
      final role = user['role'];
      switch (role) {
        case 'admin':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => const DashboardAdminScreen()));
          break;
        case 'owner':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (_) => const DashboardOwnerScreen()));
          break;
        case 'customer':
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => HomeCustomerScreen()));
          break;
        default:
          setState(() {
            errorMessage = "Role tidak dikenal.";
          });
      }
    } else {
      setState(() {
        errorMessage = "Email atau password salah, atau akun belum terdaftar.";
      });
    }

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 10)
              ],
            ),
            width: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Selamat Datang 👋",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                const Text(
                  "Masuk ke akun kamu untuk melanjutkan",
                  style: TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
                const SizedBox(height: 16),
                if (errorMessage != null)
                  Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isLoading ? null : handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text("Masuk", style: TextStyle(fontSize: 16)),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text("Belum punya akun? Daftar sekarang"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

extension on Function({required Widget child, void Function()? onPressed, required dynamic style}) {
  styleFrom({required MaterialColor backgroundColor, required EdgeInsets padding, required RoundedRectangleBorder shape}) {}
}
// TODO Implement this library.