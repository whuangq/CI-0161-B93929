import 'package:isar/isar.dart';
import 'package:tarea3/domain/schemas/professor.dart';

part 'course.g.dart';

@collection
class Course {
  Id? id = Isar.autoIncrement;
  @Index(unique: true)
  
  String? code;
  String? name;
  final professor = IsarLinks<Professor>();
}