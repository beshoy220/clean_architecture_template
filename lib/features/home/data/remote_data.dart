import 'package:clean_architecture_template/features/home/data/model.dart';
import 'package:flutter/material.dart';

abstract class HomeRemoteDataSource {
  Future<StudentHomeModel> getStudentHome();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<StudentHomeModel> getStudentHome() async {
    // pretend API response
    debugPrint('Fetching student home data from remote API...');
    final response = {"assignments_count": 5, "quizzes_count": 2, "id": 1};

    return StudentHomeModel.fromJson(response);
  }
}
