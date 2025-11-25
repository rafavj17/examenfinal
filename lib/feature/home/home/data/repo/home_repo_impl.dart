import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/accounts_manager/data/model/accounts_model.dart';
import 'package:personal_expenses/feature/home/data/model/trans_model.dart';
import 'package:personal_expenses/feature/home/domain/entity/resume_home_entity.dart';
import 'package:personal_expenses/feature/home/domain/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<DataResponse<ResumeHomeEntity>> getResume() async {
    final db = await DatabaseHelper().database;

    double totalIncome = 0.0;
    double totalExpense = 0.0;

    try {
      final accountRes = await db.query('Accounts', where: 'isActive = 1');
      if (accountRes.isEmpty) {
        return DataResponse.error('No hay cuentas registradas');
      }
      final accounts = accountRes.map(
        (account) => AccountModel.fromMap(account),
      );
      final totalBalance = accounts.fold<double>(
        0.0,
        (prev, element) => prev + element.balance,
      );

      final incomeTransRes = await db.query(
        'Trans',
        where: 'transactionType = "income"',
      );
      if (incomeTransRes.isEmpty) {
        totalIncome = 0.0;
      }
      final transIncome = incomeTransRes.map(
        (income) => TransModel.fromMap(income),
      );
      for (TransModel income in transIncome) {
        final transMonth = income.transactionDate.month;
        final month = DateTime.now().month;
        if (transMonth == month) {
          totalIncome += income.amount;
        }
      }

      final expenseTransRes = await db.query(
        'Trans',
        where: 'transactionType = "expense"',
      );
      if (incomeTransRes.isEmpty) {
        totalExpense = 0.0;
      }
      final transExpense = expenseTransRes.map(
        (income) => TransModel.fromMap(income),
      );
      for (TransModel expense in transExpense) {
        final transMonth = expense.transactionDate.month;
        final month = DateTime.now().month;
        if (transMonth == month) {
          totalExpense += expense.amount;
        }
      }

      return DataResponse.success(
        ResumeHomeEntity(
          totalIncome: totalIncome,
          totalExpense: totalExpense,
          totalBalance: totalBalance,
        ),
      );
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
