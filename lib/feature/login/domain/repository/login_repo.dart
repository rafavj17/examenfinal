import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/login/domain/model/user_login.dart';

abstract class LoginRepo {
  Future<DataResponse<UserLogin>> isUserRegistered(UserLogin user);
}
