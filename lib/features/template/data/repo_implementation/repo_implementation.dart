import 'package:clean_architecture_template/features/template/data/data_sources/remote_data_source.dart';
import 'package:clean_architecture_template/features/template/domain/entities/template_entity.dart';
import 'package:clean_architecture_template/features/template/domain/repo_interface/repo_interface.dart';

class TemplateRepoImpl implements TemplateRepoInterface {
  final TemplateRemoteDataSource remote = TemplateRemoteDataSourceImpl();

  @override
  Future<TemplateEntity> getTemplate() async {
    return await remote.getTemplate();
  }
}
