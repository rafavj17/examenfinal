import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/accounts_manager/data/repo/accounts_manager_repo_impl.dart';
import 'package:personal_expenses/feature/accounts_manager/domain/entity/account_entity.dart';

class ListAccountsProvider extends ChangeNotifier {
  DataResponse<List<AccountEntity>> _accountsResponse = DataResponse.success(
    [],
  );

  DataResponse<List<AccountEntity>> get accountsResponse => _accountsResponse;

  ListAccountsProvider() {
    getAccounts();
  }

  void getAccounts() async {
    final res = await AccountsManagerRepoImpl().getAccounts();
    _accountsResponse = res;
    notifyListeners();
  }

}
