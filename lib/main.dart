import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/screens/hom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student app',
       debugShowCheckedModeBanner: false,
      theme: ThemeData(
     
        primarySwatch: Colors.teal,
        
      ),
      home:const ScreenHome(),
  
    );
  }
}
