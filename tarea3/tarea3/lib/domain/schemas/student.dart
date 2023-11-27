import 'package:isar/isar.dart';
import 'course.dart';

part 'student.g.dart';

@collection
class Student {
  Id? id = Isar.autoIncrement;
  String? firstName;
  String? lastName;
  @Index(unique: true)
  String? email;
  final courses = IsarLinks<Course>();
}
