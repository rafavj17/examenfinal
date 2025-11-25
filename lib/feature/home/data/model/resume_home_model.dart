class ResumeHomeModel {
  final double totalIncome;
  final double totalExpense;
  final double totalBalance;

  ResumeHomeModel({
    required this.totalIncome,
    required this.totalExpense,
    required this.totalBalance,
  });

  factory ResumeHomeModel.fromMap(Map<String, dynamic> map) {
    return ResumeHomeModel(
      totalIncome: map['totalIncome']?.toDouble() ?? 0.0,
      totalExpense: map['totalExpense']?.toDouble() ?? 0.0,
      totalBalance: map['totalBalance']?.toDouble() ?? 0.0,
    );
  }
}
