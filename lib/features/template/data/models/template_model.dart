import 'dart:convert';
import 'package:clean_architecture_template/features/template/domain/entities/template_entity.dart';

// A model class that extends from it's entity class
class TemplateModel extends TemplateEntity {
  late int id;
  TemplateModel({
    required this.id,
    required super.title,
    required super.description,
  });

  factory TemplateModel.fromJson(Map<String, dynamic> json) {
    return TemplateModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  TemplateModel copyWith({int? id, String? title, String? description}) {
    return TemplateModel(
      id: id ?? this.id,
      title: title ?? super.title,
      description: description ?? super.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
    };
  }

  factory TemplateModel.fromMap(Map<String, dynamic> map) {
    return TemplateModel(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'TemplateModel(id: $id, title: $title, description: $description)';

  @override
  bool operator ==(covariant TemplateModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}
