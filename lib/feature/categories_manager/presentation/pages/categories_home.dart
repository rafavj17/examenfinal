import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/constants_app.dart';
import 'package:personal_expenses/feature/categories_manager/presentation/providers/categories_provider.dart';
import 'package:personal_expenses/feature/categories_manager/presentation/widgets/alert_dialog_category.dart';
import 'package:provider/provider.dart';

class CategoriesHome extends StatefulWidget {
  const CategoriesHome({super.key});

  @override
  State<CategoriesHome> createState() => _CategoriesHomeState();
}

class _CategoriesHomeState extends State<CategoriesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Categorias',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Consumer<CategoriesProvider>(
        builder: (context, provider, child) {
          final response = provider.categoriesResponse;

          if (!response.success) {
            return Center(child: Text(response.message));
          }
          final categories = response.data;
          if (categories!.isEmpty) {
            return Center(child: Text(response.message));
          }
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {},
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent[50],
        foregroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialogCategory(),
          );
        },
      ),
    );
  }
}
