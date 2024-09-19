import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:retest_app/model/model.dart';

ValueNotifier<List<Student>> studentListNotifier = ValueNotifier([]);
Future<void> addStudent(Student value) async {
  final studentDb = await Hive.openBox<Student>('student_db');
  await studentDb.add(value);
  studentListNotifier.value.add(value);

  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDb = await Hive.openBox<Student>('student_db');
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDb.values);

  studentListNotifier.notifyListeners();
}
