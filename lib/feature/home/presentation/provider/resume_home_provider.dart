import 'package:flutter/material.dart';
import 'package:personal_expenses/core/constants/data_response.dart';
import 'package:personal_expenses/feature/home/data/repo/home_repo_impl.dart';
import 'package:personal_expenses/feature/home/domain/entity/resume_home_entity.dart';

class ResumeHomeProvider extends ChangeNotifier {
  DataResponse<ResumeHomeEntity> _resumeResponse = DataResponse.success(
    ResumeHomeEntity(totalIncome: 0.0, totalExpense: 0.0, totalBalance: 0.0),
  );

  DataResponse<ResumeHomeEntity> get resumeResponse => _resumeResponse;

  void getResume() async {
    _resumeResponse = await HomeRepoImpl().getResume();
    notifyListeners();
  }
}
