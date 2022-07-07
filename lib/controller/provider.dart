import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';


import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../models/hive_model.dart';

class ProviderModel extends ChangeNotifier{

  
 List<StudentModel> studentList = [];

 String imageString = '';
 void addStudent(StudentModel datas)async{
  
 final studentDB = await Hive.openBox<StudentModel>('studentDB');
 studentDB.add(datas);
 studentList.add(datas);
 imageString='';
 
 notifyListeners();
}
                          

 void getAllStudent() async{
  final studentDB = await Hive.openBox<StudentModel>('studentDB');
  studentList.clear();
  studentList.addAll(studentDB.values);
 notifyListeners();
}

 void addImage(XFile? image){
  if(image!= null){
  
  final bytes = File(image.path).readAsBytesSync();
  imageString = base64Encode(bytes);
  notifyListeners();
  }

}

void delete(StudentModel data,int index){
    data.delete();
     studentList.removeAt(index);
    notifyListeners();
}

}