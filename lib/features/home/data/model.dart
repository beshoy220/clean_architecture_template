import 'dart:convert';
import 'package:clean_architecture_template/features/home/domain/entities.dart';

// A model class that extends from it's entity class
class StudentHomeModel extends StudentHomeEntity {
  late int id;
  StudentHomeModel({
    required id,
    required super.assignmentsCount,
    required super.quizzesCount,
  });

  factory StudentHomeModel.fromJson(Map<String, dynamic> json) {
    return StudentHomeModel(
      id: json['id'],
      assignmentsCount: json['assignments_count'],
      quizzesCount: json['quizzes_count'],
    );
  }

  StudentHomeModel copyWith({
    int? id,
    int? assignmentsCount,
    int? quizzesCount,
  }) {
    return StudentHomeModel(
      id: id ?? this.id,
      assignmentsCount: assignmentsCount ?? super.assignmentsCount,
      quizzesCount: quizzesCount ?? super.quizzesCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'assignmentsCount': assignmentsCount,
      'quizzesCount': quizzesCount,
    };
  }

  factory StudentHomeModel.fromMap(Map<String, dynamic> map) {
    return StudentHomeModel(
      id: map['id'] as int,
      assignmentsCount: map['assignmentsCount'] as int,
      quizzesCount: map['quizzesCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'StudentHomeModel(id: $id, assignmentsCount: $assignmentsCount, quizzesCount: $quizzesCount)';

  @override
  bool operator ==(covariant StudentHomeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.assignmentsCount == assignmentsCount &&
        other.quizzesCount == quizzesCount;
  }

  @override
  int get hashCode =>
      id.hashCode ^ assignmentsCount.hashCode ^ quizzesCount.hashCode;
}
