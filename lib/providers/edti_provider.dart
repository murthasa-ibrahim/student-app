import 'package:flutter/cupertino.dart';
import 'package:getx_student_app/models/hive_model.dart';

class EditProvider extends ChangeNotifier{

   // text controllers 

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();

  // init state function
  
  void  onInit(StudentModel data){
      nameController.text = data.name;
      ageController.text = data.age;
      placeController.text = data.place;
      phoneController.text = data.phone;

    }
 

  // ontap function 

  void edit(StudentModel data){
     nameController.text = 
     data.name = nameController.text;
     data.age = ageController.text;
     data.place = placeController.text;
     data.phone = phoneController.text;
     data.save();
     notifyListeners();
  }

 
}