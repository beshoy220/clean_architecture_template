import 'package:clean_architecture_template/features/home/domain/entities.dart';
import 'package:clean_architecture_template/features/home/domain/usecase.dart';
import 'package:flutter/material.dart';

class StudentHomeProvider extends ChangeNotifier {
  final GetStudentHomeUsecase getStudentHome = GetStudentHomeUsecase();

  // State
  StudentHomeEntity? studentHome;
  bool isLoading = false;
  String? errorMessage;

  // Load data
  Future<void> loadHomeDataProvider() async {
    try {
      isLoading = true;
      errorMessage = null;
      final data = await getStudentHome.call();
      studentHome = data;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
