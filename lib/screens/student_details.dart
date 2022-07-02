import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/screens/edit_student.dart';

import '../my widgets/widgets.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Student Details 🧑',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 100,
              ),
              const NameCard(
                data: 'murrr',
                item: 'name',
              ),
              const NameCard(
                data: '12',
                item: 'Age',
              ),
              const NameCard(
                data: 'calicut',
                item: 'Place',
              ),
              const NameCard(data: '9061119738', item: 'Phone'),
              IconButton(onPressed: () {Get.to(const  EditStudent());}, icon: const Icon(Icons.edit)),
            ],
          ),
        ),
      ),
    );
  }
}
