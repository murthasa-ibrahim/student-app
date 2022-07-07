import 'package:flutter/material.dart';

import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/screens/hom.dart';
import '../my widgets/widgets.dart';

class EditStudent extends StatelessWidget {
   EditStudent({Key? key,required this.data}) : super(key: key);
// final StudentController studentController;
final StudentModel data;
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    nameController.text = data.name;
    ageController.text = data.age;
    placeController.text = data.place;
    phoneController.text = data.phone; 
    return Scaffold(
      body:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Edit Details 🧑',
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 100,
                  ),
                  InputCard(hintText: 'Name', controller: nameController),
                    InputCard(hintText: 'age', controller: ageController),
                      InputCard(hintText: 'place', controller: placeController),
                        InputCard(hintText: 'phone', controller: phoneController),
                  // const NameCard(
                  //   data:'' ,
                  //   item: 'name',
                  // ),
                  // const NameCard(
                  //   data: '12',
                  //   item: 'Age',
                  // ),
                  // const NameCard(
                  //   data: 'calicut',
                  //   item: 'Place',
                  // ),
                  // const NameCard(data: '9061119738', item: 'Phone'),
                  TextButton(
                  onPressed: () {
                   data.name = nameController.text;
                   data.age = ageController.text;
                   data.place = placeController.text;
                   data.phone = phoneController.text;
                   data.save();
                       Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenHome()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ))
                ],
              ),
        ),
      ));
  }
}