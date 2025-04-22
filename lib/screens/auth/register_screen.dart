import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final alamatController = TextEditingController();
  final passwordController = TextEditingController();
  final konfirmasiPasswordController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  void handleRegister() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Simulasi daftar user
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
        Navigator.pop(context); // kembali ke login
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F4F7),
      appBar: AppBar(title: const Text("Daftar Akun")),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Container(
            width: 450,
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Buat Akun Baru",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),

                  // Nama Lengkap
                  TextFormField(
                    controller: namaController,
                    decoration: const InputDecoration(labelText: "Nama Lengkap"),
                    validator: (value) => value!.isEmpty ? "Nama wajib diisi" : null,
                  ),
                  const SizedBox(height: 14),

                  // Email
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: "Email"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) =>
                    value!.contains("@") ? null : "Email tidak valid",
                  ),
                  const SizedBox(height: 14),

                  // No HP
                  TextFormField(
                    controller: hpController,
                    decoration: const InputDecoration(labelText: "Nomor HP"),
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                    value!.length < 10 ? "Nomor HP tidak valid" : null,
                  ),
                  const SizedBox(height: 14),

                  // Alamat
                  TextFormField(
                    controller: alamatController,
                    maxLines: 2,
                    decoration: const InputDecoration(labelText: "Alamat Lengkap"),
                    validator: (value) =>
                    value!.isEmpty ? "Alamat wajib diisi" : null,
                  ),
                  const SizedBox(height: 14),

                  // Password
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Password"),
                    validator: (value) =>
                    value!.length < 6 ? "Minimal 6 karakter" : null,
                  ),
                  const SizedBox(height: 14),

                  // Konfirmasi Password
                  TextFormField(
                    controller: konfirmasiPasswordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: "Konfirmasi Password"),
                    validator: (value) => value != passwordController.text
                        ? "Password tidak cocok"
                        : null,
                  ),
                  const SizedBox(height: 24),

                  if (errorMessage != null)
                    Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),

                  ElevatedButton(
                    onPressed: isLoading ? null : handleRegister,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text("Daftar Sekarang", style: TextStyle(fontSize: 16)),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Sudah punya akun? Masuk di sini"),
                  ),
                ],
              ),
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

ElevatedButton({void Function()? onPressed, required style, required Widget child}) {
}
// TODO Implement this library.