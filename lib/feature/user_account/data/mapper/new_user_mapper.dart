import 'package:personal_expenses/feature/user_account/data/model/new_user_model.dart';
import 'package:personal_expenses/feature/user_account/domain/model/new_user.dart';

class NewUserMapper {
  static NewUser toEntity(NewUserModel model) {
    return NewUser(
      id: model.id,
      name: model.name,
      email: model.email,
      password: model.password,
      currency: model.currency,
    );
  }

  static NewUserModel toModel(NewUser entity) {
    return NewUserModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      password: entity.password,
      currency: entity.currency,
    );
  }
}
