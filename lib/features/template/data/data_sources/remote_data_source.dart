import 'package:clean_architecture_template/features/template/data/models/template_model.dart';
import 'package:flutter/material.dart';

abstract class TemplateRemoteDataSource {
  Future<TemplateModel> getTemplate();
}

class TemplateRemoteDataSourceImpl implements TemplateRemoteDataSource {
  @override
  Future<TemplateModel> getTemplate() async {
    // pretend API response
    debugPrint('Fetching student home data from remote API...');
    final response = {
      "id": 1,
      "title": "Hello there",
      "description": "I am a template description",
    };

    return TemplateModel.fromJson(response);
  }
}
