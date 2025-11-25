class Category {
  final int? id;
  final String name;
  final String categoryType;
  final String color;
  final String icon;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? parentCategoryId;
  final int userId;

  Category({
    this.id,
    required this.name,
    required this.categoryType,
    required this.color,
    required this.icon,
    this.isActive = true,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.parentCategoryId,
    required this.userId,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
