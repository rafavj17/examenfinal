import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/categories_manager/data/mapper/category_mapper.dart';
import 'package:personal_expenses/feature/categories_manager/data/model/category_model.dart';
import 'package:personal_expenses/feature/categories_manager/domain/entity/category.dart';
import 'package:personal_expenses/feature/categories_manager/domain/repo/category_repo.dart';

class CategoryRepoImpl implements CategoryRepo {
  @override
  Future<DataResponse<bool>> deleteCategory(int categoryId) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  Future<DataResponse<Category>> createCategory(Category category) {
    // TODO: implement createCategory
    throw UnimplementedError();
  }

  @override
  Future<DataResponse<List<Category>>> getCategories(int userId) async {
    final db = await DatabaseHelper().database;

    try {
      final res = await db.query(
        'Categories',
        where: 'userId = ?',
        whereArgs: [userId],
      );

      if (res.isEmpty) {
        return DataResponse.success(
          [],
          message: 'No hay categorias registradas',
        );
      }
      return DataResponse.success(
        res
            .map(
              (categoryMap) =>
                  CategoryMapper.toEntity(CategoryModel.fromMap(categoryMap)),
            )
            .toList(),
      );
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  @override
  Future<DataResponse<Category>> updateCategory(Category category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }
}
