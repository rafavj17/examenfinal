
import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/categories_manager/domain/entity/category.dart';

abstract class CategoryRepo {
  Future<DataResponse<List<Category>>> getCategories(int userId);
  Future<DataResponse<Category>> createCategory(Category category);
  Future<DataResponse<Category>> updateCategory(Category category);
  Future<DataResponse<bool>> deleteCategory(int categoryId);
}

