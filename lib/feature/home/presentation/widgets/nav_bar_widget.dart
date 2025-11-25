import 'package:flutter/material.dart';
import 'package:personal_expenses/feature/accounts_manager/presentation/pages/accounts_home.dart';
import 'package:personal_expenses/feature/budgets_manager/presentation/pages/budgets_home.dart';
import 'package:personal_expenses/feature/categories_manager/presentation/pages/categories_home.dart';
import 'package:personal_expenses/feature/goals_manager/presentation/pages/goals_home.dart';
import 'package:personal_expenses/feature/home/presentation/pages/home_page.dart';
import 'package:personal_expenses/feature/home/presentation/widgets/destination_pages.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int indexSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: DestinationPages.getNavigationDestinatios(),
        selectedIndex: indexSelected,
        indicatorColor: Colors.blueAccent[100],
        onDestinationSelected: (value) {
          setState(() {
            indexSelected = value;
          });
        },
      ),
      body: <Widget>[
        HomePage(),
        AccountsHome(),
        CategoriesHome(),
        BudgetsHome(),
        GoalsHome(),
      ][indexSelected],
    );
  }
}
