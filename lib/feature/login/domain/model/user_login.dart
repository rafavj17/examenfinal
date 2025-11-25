class UserLogin {
  int? id;
  final String email;
  String? name;
  final String password;
  UserLogin({
    this.id,
    required this.email,
    this.name,
    required this.password,
  });
}
