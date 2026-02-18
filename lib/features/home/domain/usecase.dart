import 'package:clean_architecture_template/features/home/data/repo_implement.dart';
import 'package:clean_architecture_template/features/home/domain/entities.dart';
import 'package:clean_architecture_template/features/home/domain/repo_interface.dart';

// In a real app you might path parameters or add real logic for call function
class GetStudentHomeUsecase {
  final HomeRepositoryInterface repository = HomeRepositoryImpl();

  Future<StudentHomeEntity> call() {
    return repository.getStudentHome();
  }
}
