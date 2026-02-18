import 'package:clean_architecture_template/features/template/data/repo_implementation/repo_implementation.dart';
import 'package:clean_architecture_template/features/template/domain/entities/template_entity.dart';
import 'package:clean_architecture_template/features/template/domain/repo_interface/repo_interface.dart';

class TemplateUsecase {
  final TemplateRepoInterface repository = TemplateRepoImpl();

  Future<TemplateEntity> getTemplate() {
    return repository.getTemplate();
  }
}
