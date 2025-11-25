import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/app_routes.dart';
import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/provider/list_accounts_provider.dart';
import 'package:personal_expenses/feature/categories_manager/presentation/providers/categories_provider.dart';
import 'package:personal_expenses/feature/home/presentation/provider/resume_home_provider.dart';
import 'package:personal_expenses/feature/login/presentation/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().database;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
        ChangeNotifierProvider<ListAccountsProvider>(
          create: (_) => ListAccountsProvider(),
        ),
        ChangeNotifierProvider<ResumeHomeProvider>(
          create: (_) => ResumeHomeProvider(),
        ),
        ChangeNotifierProvider<CategoriesProvider>(
          create: (_) => CategoriesProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Transacciones Personales',
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
