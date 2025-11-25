import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/data/local/database_helper.dart';
import 'package:personal_expenses/feature/login/data/mapper/user_mapper.dart';
import 'package:personal_expenses/feature/login/data/model/user_model.dart';
import 'package:personal_expenses/feature/login/domain/model/user_login.dart';
import 'package:personal_expenses/feature/login/domain/repository/login_repo.dart';

class LoginRepoImpl implements LoginRepo {
  @override
  Future<DataResponse<UserLogin>> isUserRegistered(UserLogin user) async {
    final db = await DatabaseHelper().database;
    try {
      final userResponse = await db.query(
        'users',
        where: 'email = ?',
        whereArgs: [user.email],
      );
      if (userResponse.isEmpty) {
        return DataResponse.error('El usuario no esta registrado');
      }
      final userTemp = UserLoginModel.fromMap(userResponse.first);
      if (userTemp.password != user.password) {
        return DataResponse.error('Contraseña incorrecta');
      }
      return DataResponse.success(
        UserMapper.toEntity(userTemp),
        message: userTemp.name!,
      );
    } catch (error) {
      return DataResponse.error(error.toString());
    }
  }
}


/* 
  [
    {
      'id': 1,
      'email': 'asdfa@adsf.asd',
      'name': 'asdfasdfs'
    },
  ]
 */