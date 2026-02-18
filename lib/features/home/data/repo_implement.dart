import 'package:clean_architecture_template/features/home/data/remote_data.dart';
import 'package:clean_architecture_template/features/home/domain/entities.dart';
import 'package:clean_architecture_template/features/home/domain/repo_interface.dart';

// This is the implementation of the HomeRepository interface.
class HomeRepositoryImpl implements HomeRepositoryInterface {
  final HomeRemoteDataSource remote = HomeRemoteDataSourceImpl();

  @override
  Future<StudentHomeEntity> getStudentHome() async {
    return await remote.getStudentHome();
  }
}
