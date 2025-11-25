class TransEntity {
  final int? id;
  final String transactionType;
  final double amount;
  final String? description;
  final String? notes;
  final DateTime transactionDate;
  final String? recipeImagePath;
  final String? location;
  final int? transferToAccountId;
  final bool isRecurring;
  final int? recurringTransactionId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int? userId;
  final int? accountId;
  final int? categoryId;

  TransEntity({
    this.id,
    required this.transactionType,
    required this.amount,
    this.description,
    this.notes,
    required this.transactionDate,
    this.recipeImagePath,
    this.location,
    this.transferToAccountId,
    this.isRecurring = false,
    this.recurringTransactionId,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.userId,
    this.accountId,
    this.categoryId,
  }) : createdAt = createdAt ?? DateTime.now(),
       updatedAt = updatedAt ?? DateTime.now();
}
