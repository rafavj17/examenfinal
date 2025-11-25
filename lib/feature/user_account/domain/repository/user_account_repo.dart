import 'package:personal_expenses/feature/user_account/domain/model/new_user.dart';

abstract class UserAccountRepo {
  Future<bool> registerUser(NewUser user);
  Future<NewUser> getUser(int id);
}
