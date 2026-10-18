import 'package:better_phenikaa_schedule/core/contracts/qldt_entity.dart';

final class UserDto extends QldtEntity<String> {
  const UserDto({required this.studentId, required this.displayName})
    : super(studentId);

  final String studentId;
  final String displayName;
}

final class SemesterDto extends QldtEntity<String> {
  const SemesterDto({
    required String id,
    required this.name,
    required this.startDate,
    required this.endDate,
  }) : super(id);

  final String name;
  final DateTime startDate;
  final DateTime endDate;
}

final class ClassDto extends QldtEntity<String> {
  const ClassDto({
    required String id,
    required this.subjectCode,
    required this.subjectName,
    required this.room,
    required this.lecturer,
    required this.startAt,
    required this.endAt,
  }) : super(id);

  final String subjectCode;
  final String subjectName;
  final String room;
  final String lecturer;
  final DateTime startAt;
  final DateTime endAt;
}

final class ExamDto extends QldtEntity<String> {
  const ExamDto({
    required String id,
    required this.subjectCode,
    required this.subjectName,
    required this.room,
    required this.startAt,
    required this.endAt,
  }) : super(id);

  final String subjectCode;
  final String subjectName;
  final String room;
  final DateTime startAt;
  final DateTime endAt;
}

final class QldtImportPayload {
  const QldtImportPayload({
    required this.user,
    required this.semester,
    required this.classes,
    required this.exams,
    required this.syncedAt,
  });

  final UserDto user;
  final SemesterDto semester;
  final List<ClassDto> classes;
  final List<ExamDto> exams;
  final DateTime syncedAt;
}

final class WidgetSnapshot {
  const WidgetSnapshot({
    required this.subjectName,
    required this.room,
    required this.startAt,
    required this.endAt,
  });

  final String subjectName;
  final String room;
  final DateTime startAt;
  final DateTime endAt;
}
