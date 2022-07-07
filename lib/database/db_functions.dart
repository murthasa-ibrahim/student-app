// import 'dart:convert';
// import 'dart:io';

// import 'package:getx_student_app/models/hive_model.dart';
// import 'package:hive_flutter/adapters.dart';

// List<StudentModel> studentList =[];

// void addStudent(StudentModel datas)async{
//  final studentDB = await Hive.openBox<StudentModel>('studentDB');
//  studentDB.add(datas);
// }


// void getAllStudent() async{
//   final studentDB = await Hive.openBox<StudentModel>('studentDB');

// }


// void addImage(File imagefile){
//   final bytes = File(imagefile.path).readAsBytesSync();
//   final imagString = base64Encode(bytes);
// }

