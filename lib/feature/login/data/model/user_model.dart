class UserLoginModel {
  int? id;
  final String email;
  String? name;
  final String password;
  UserLoginModel({
    this.id,
    required this.email,
    this.name,
    required this.password,
  });

  factory UserLoginModel.fromMap(Map<String, dynamic> map) {
    return UserLoginModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
    };
  }

  UserLoginModel copyWith({
    int? id,
    String? email,
    String? name,
    String? password,
  }) {
    return UserLoginModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }
}
