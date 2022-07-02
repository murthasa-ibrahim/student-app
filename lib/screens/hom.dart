import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_student_app/screens/add_student.dart';
import 'package:getx_student_app/screens/student_details.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student App',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: ((context, index) {
                  return  ListTile(
                    onTap: () {
                      Get.to(const StudentDetails());
                    },
                    leading:const  CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.black,
                    ),
                    title: const Text('murthasa'),
                    subtitle:const Text('22'),
                  );
                }),
                itemCount: 10,
              ),
            )
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Get.to(const AddStudent()); },
          child: const Icon(Icons.add),
        ));
  }
}
