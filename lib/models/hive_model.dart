


import 'package:hive_flutter/adapters.dart';
part 'hive_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject   {
  @HiveField(0)
  String name;
  @HiveField(1)
  String age;
  @HiveField(2)
   String place;
  @HiveField(3)
   String phone;
  @HiveField(4)
   String imagString;

  StudentModel(
      {required this.name,
      required this.age,
      required this.place,
      required this.phone,
      required this.imagString});
}


