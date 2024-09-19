import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? age;
  @HiveField(2)
  String? rollNo;

  Student({required this.name, required this.age, required this.rollNo});
}
