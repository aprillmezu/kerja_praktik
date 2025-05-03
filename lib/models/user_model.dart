class UserModel {
  final String uid;
  final String email;
  final String name;
  final String id;
  final String? role; // nullable

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.id,
    this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      id: json['id'] ?? '',
      role: json['role'], // biarkan nullable
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'id': id,
      'role': role,
    };
  }
}
