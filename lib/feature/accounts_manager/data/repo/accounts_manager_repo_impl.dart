import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/accounts_manager/data/mapper/accounts_mapper.dart';
import 'package:personal_expenses/feature/accounts_manager/data/model/accounts_model.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/entity/account_entity.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/repo/accounts_manager_repo.dart';

class AccountsManagerRepoImpl implements AccountsManagerRepo {
  @override
  Future<DataResponse<AccountEntity>> createAccount(
    AccountEntity accountEntity,
  ) async {
    final db = await DatabaseHelper().database;
    final accountModel = AccountsMapper.toModel(accountEntity);

    try {
      final response = await db.insert(
        'Accounts',
        accountModel
            .copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now())
            .toMap(),
      );
      // int => id
      if (response <= 0) {
        return DataResponse.error('No se pudo registrar la cuenta');
      }
      return DataResponse.success(
        AccountsMapper.toEntity(accountModel.copyWith(id: response)),
      );
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }

  @override
  Future<DataResponse<List<AccountEntity>>> getAccounts() async {
    final db = await DatabaseHelper().database;

    try {
      final response = await db.query('Accounts');
      if (response.isEmpty) {
        return DataResponse.success([], message: 'No hay cuentas registradas');
      }
      final listAccounts = response
          .map(
            (account) => AccountsMapper.toEntity(AccountModel.fromMap(account)),
          )
          .toList();
      return DataResponse.success(listAccounts);
    } catch (e) {
      return DataResponse.error(e.toString());
    }
  }
}
