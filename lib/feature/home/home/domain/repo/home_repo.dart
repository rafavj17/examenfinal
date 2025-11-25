import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/home/domain/entity/resume_home_entity.dart';

abstract class HomeRepo {
  Future<DataResponse<ResumeHomeEntity>> getResume();
}