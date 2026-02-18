import 'package:clean_architecture_template/features/home/domain/entities.dart';

// This is the Interface that the data layer will Implement,
// and the domain layer will use to call the data layer.
abstract class HomeRepositoryInterface {
  Future<StudentHomeEntity> getStudentHome();
}
