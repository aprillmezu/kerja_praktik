// lib/models/user_model.dart

class UserModel {
  final int? id;
  final String name;
  final String email;
  final String? role;
  final String? phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    this.role,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    role: json['role'],
    phone: json['phone'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'role': role,
    'phone': phone,
  };
}
