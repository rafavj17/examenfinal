class CategoryModel {
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

  CategoryModel({
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

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as int?,
      name: map['name'] as String? ?? '',
      categoryType: map['categoryType'] as String? ?? '',
      color: map['color'] as String? ?? 'FF14b6eb',
      icon: map['icon'] as String? ?? '',
      isActive: (map['isActive'] is int)
          ? (map['isActive'] as int) == 1
          : (map['isActive'] as bool? ?? true),
      createdAt: map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : DateTime.now(),
      updatedAt: map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : DateTime.now(),
      parentCategoryId: map['parentCategoryId'] as int?,
      userId: map['userId'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'categoryType': categoryType,
      'color': color,
      'icon': icon,
      'isActive': isActive ? 1 : 0,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'parentCategoryId': parentCategoryId,
      'userId': userId,
    };
  }

  CategoryModel copyWith({
    int? id,
    String? name,
    String? categoryType,
    String? color,
    String? icon,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? parentCategoryId,
    int? userId,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryType: categoryType ?? this.categoryType,
      color: color ?? this.color,
      icon: icon ?? this.icon,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      parentCategoryId: parentCategoryId ?? this.parentCategoryId,
      userId: userId ?? this.userId,
    );
  }
}
