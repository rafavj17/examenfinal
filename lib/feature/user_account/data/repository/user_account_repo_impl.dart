import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/user_account/data/mapper/new_user_mapper.dart';
import 'package:personal_expenses/feature/user_account/domain/model/new_user.dart';
import 'package:personal_expenses/feature/user_account/domain/repository/user_account_repo.dart';

class UserAccountRepoImpl implements UserAccountRepo {
  @override
  Future<bool> registerUser(NewUser user) async {
    final db = await DatabaseHelper().database;

    final result = await db.insert(
      'Users',
      NewUserMapper.toModel(
        user,
      ).copyWith(createdAt: DateTime.now(), updatedAt: DateTime.now()).toMap(),
    );
    if (result > 0) {
      return true;
    }
    return false;
  }
  
  @override
  Future<NewUser> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}
