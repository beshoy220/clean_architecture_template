import 'package:clean_architecture_template/features/template/domain/entities/template_entity.dart';

abstract class TemplateRepoInterface {
  Future<TemplateEntity> getTemplate();
}
