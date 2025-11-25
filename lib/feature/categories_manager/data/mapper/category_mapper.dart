import 'package:personal_expenses/feature/categories_manager/data/model/category_model.dart';
import 'package:personal_expenses/feature/categories_manager/domain/entity/category.dart';

class CategoryMapper {
  static Category toEntity(CategoryModel model) {
    return Category(
      id: model.id,
      name: model.name,
      categoryType: model.categoryType,
      color: model.color,
      icon: model.icon,
      isActive: model.isActive,
      createdAt: model.createdAt,
      updatedAt: model.updatedAt,
      parentCategoryId: model.parentCategoryId,
      userId: model.userId,
    );
  }

  static CategoryModel toModel(Category entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      categoryType: entity.categoryType,
      color: entity.color,
      icon: entity.icon,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      parentCategoryId: entity.parentCategoryId,
      userId: entity.userId,
    );
  }
}
