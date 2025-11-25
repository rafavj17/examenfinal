class TransModel {
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

  TransModel({
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

  factory TransModel.fromMap(Map<String, dynamic> map) {
    return TransModel(
      id: map['id'],
      transactionType: map['transactionType'],
      amount: map['amount'].toDouble() ?? 0.0,
      description: map['description'],
      notes: map['notes'],
      transactionDate: DateTime.parse(map['transactionDate']),
      recipeImagePath: map['recipeImagePath'],
      location: map['location'],
      transferToAccountId: map['transferToAccountId'],
      isRecurring: map['isRecurring'] == 1 ? true : false,
      recurringTransactionId: map['recurringTransactionId'],
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      userId: map['userId'],
      accountId: map['accountId'],
      categoryId: map['categoryId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'transactionType': transactionType,
      'amount': amount,
      'description': description,
      'notes': notes,
      'transactionDate': transactionDate.toIso8601String(),
      'recipeImagePath': recipeImagePath,
      'location': location,
      'transferToAccountId': transferToAccountId,
      'isRecurring': isRecurring ? 1 : 0,
      'recurringTransactionId': recurringTransactionId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'userId': userId,
      'accountId': accountId,
      'categoryId': categoryId,
    };
  }

  TransModel copyWith({
    int? id,
    String? transactionType,
    double? amount,
    String? description,
    String? notes,
    DateTime? transactionDate,
    String? recipeImagePath,
    String? location,
    int? transferToAccountId,
    bool? isRecurring,
    int? recurringTransactionId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? userId,
    int? accountId,
    int? categoryId,
  }) {
    return TransModel(
      id: id ?? this.id,
      transactionType: transactionType ?? this.transactionType,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      transactionDate: transactionDate ?? this.transactionDate,
      recipeImagePath: recipeImagePath ?? this.recipeImagePath,
      location: location ?? this.location,
      transferToAccountId: transferToAccountId ?? this.transferToAccountId,
      isRecurring: isRecurring ?? this.isRecurring,
      recurringTransactionId:
          recurringTransactionId ?? this.recurringTransactionId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      accountId: accountId ?? this.accountId,
      categoryId: categoryId ?? this.categoryId,
    );
  }
}
