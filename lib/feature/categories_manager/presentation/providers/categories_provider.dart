import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/categories_manager/data/repo/category_repo_impl.dart';
import 'package:personal_expenses/feature/categories_manager/domain/entity/category.dart';

class CategoriesProvider extends ChangeNotifier {
  DataResponse<List<Category>> _categoriesResponse = DataResponse.success([]);

  DataResponse<List<Category>> get categoriesResponse => _categoriesResponse;

  CategoriesProvider({int userId = 1}) {
    getCategories(userId);
  }

  void getCategories(int userId) async {
    final res = await CategoryRepoImpl().getCategories(userId);
    _categoriesResponse = res;
    notifyListeners();
  }
}
