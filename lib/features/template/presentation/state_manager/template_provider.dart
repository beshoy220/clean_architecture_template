import 'package:clean_architecture_template/features/template/domain/entities/template_entity.dart';
import 'package:clean_architecture_template/features/template/domain/usecases/template_usecase.dart';
import 'package:flutter/material.dart';

class TemplateProvider extends ChangeNotifier {
  final TemplateUsecase getTemplateProvider = TemplateUsecase();

  // State
  TemplateEntity? templateProvider;
  bool isLoading = false;
  String? errorMessage;

  // Load data
  Future<void> loadTemplateDataProvider() async {
    try {
      isLoading = true;
      errorMessage = null;
      TemplateEntity? data = await getTemplateProvider.getTemplate();
      templateProvider = data;
      notifyListeners();
    } catch (e) {
      errorMessage = e.toString();
      print('Error in provider layer');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
