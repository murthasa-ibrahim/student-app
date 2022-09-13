import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';

import '../models/hive_model.dart';

class HomeProvider extends ChangeNotifier {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();

    final ScrollController firstController = ScrollController();

  List<StudentModel> studentList = [];

  String imageString = '';
  final formKey = GlobalKey<FormState>();

  // add student function
  void addStudent(StudentModel datas) async {
    final studentDB = await Hive.openBox<StudentModel>('studentDB');
    studentDB.add(datas);
    studentList.add(datas);
    notifyListeners();
  }

  // function to show added student in home page
  void getAllStudent() async {
    final studentDB = await Hive.openBox<StudentModel>('studentDB');
    studentList.clear();
    studentList.addAll(studentDB.values);
    notifyListeners();
  }

  // delete student from home
  void delete(StudentModel data, int index) {
    data.delete();
    studentList.removeAt(index);
    notifyListeners();
  }

  // when submit button click
  void onButtonClick(BuildContext context) {
    if (formKey.currentState!.validate()) {
      final name = nameController.text;
      final age = ageController.text;
      final place = placeController.text;
      final phone = phoneController.text;

      final student = StudentModel(
          name: name,
          age: age,
          place: place,
          phone: phone,
          imagString: imageString);
      addStudent(student);
      Navigator.of(context).pop();
    }
  }

  // image picking function

  File? imagefile;

  void chosePick(source, BuildContext context) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      imagefile = File(image.path);
      // addImage(image);
      final bytes = File(image.path).readAsBytesSync();
      imageString = base64Encode(bytes);
      notifyListeners();
    }
  }

  // clearing the values from controllers
  clear() {
    nameController.clear();
    ageController.clear();
    phoneController.clear();
    placeController.clear();
    imagefile = null;
    imageString = '';
  }
}
