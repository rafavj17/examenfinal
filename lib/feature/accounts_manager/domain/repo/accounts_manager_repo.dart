import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/entity/account_entity.dart';

abstract class AccountsManagerRepo {
  Future<DataResponse<AccountEntity>> createAccount(
    AccountEntity accountEntity,
  );
  Future<DataResponse<List<AccountEntity>>> getAccounts();
}
