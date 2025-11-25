class NewUserModel {
  int? id;
  final String name;
  final String email;
  final String password;
  final String currency;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  NewUserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.currency,
    this.createdAt,
    this.updatedAt,
  });

  factory NewUserModel.fromMap(Map<String, dynamic> map) {
    return NewUserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      currency: map['currency'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'currency': currency,
      'createdAt': createdAt!.toIso8601String(),
      'updatedAt': updatedAt!.toIso8601String(),
    };
  }

  NewUserModel copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? currency,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return NewUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      currency: currency ?? this.currency,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
