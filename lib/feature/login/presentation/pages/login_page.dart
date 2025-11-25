import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/app_routes.dart';
import 'package:personal_expenses/core/constants/constants_app.dart';
import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/core/constants/global_widgets.dart';
import 'package:personal_expenses/feature/login/data/repository/login_repo_impl.dart';
import 'package:personal_expenses/feature/login/domain/model/user_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: size.height * .05,
          horizontal: size.width * .075,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .25),
            Text(
              'Bienvenido de nuevo',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            Text(
              'Inicia sesión para continuar con tu control de gastos',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15.5, color: Colors.black54),
            ),
            SizedBox(height: size.height * .025),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: Text('Correo electrónico'),
                    ),
                  ),
                  TextField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    decoration: InputDecoration(
                      label: Text('Contraseña'),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () async {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    final userLogin = UserLogin(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    final res = await LoginRepoImpl().isUserRegistered(
                      userLogin,
                    );
                    if (res.success) {
                      userLoged = res.data!;
                      _showMessage(res);
                      _nextPage();
                    }
                  } else {
                    _showMessage(
                      DataResponse.error('Complete los campos, por favor'),
                    );
                  }
                },
                child: Text('Iniciar sesión'),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Olvidaste tu contraseña?',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
            SizedBox(height: size.height * .2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Colors.lightBlueAccent[100],
                  ),
                  foregroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                ),
                child: Text('Registrarse'),
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.newUser),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _nextPage() {
    Navigator.pushNamed(context, '/navBar');
  }

  void _showMessage(DataResponse<UserLogin> res) {
    if (res.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        GlobalWidgets.snackMessage(context, 'Bienvenido ${res.message}'),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(GlobalWidgets.snackMessage(context, res.message));
    }
  }
}
