import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_student_app/controller/provider.dart';
import 'package:getx_student_app/screens/add_student.dart';
import 'package:getx_student_app/screens/student_details.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
   ScreenHome({Key? key}) : super(key: key);
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
              child:
                 Consumer<ProviderModel>(
                   builder: (ctx, value, child)  {
                    value.getAllStudent();
                     return ListView.builder(
                      itemBuilder: ((context, index) {
                        final data = value.studentList[index];
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: ListTile(
                              onTap: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => StudentDetails(details: data),));
                              },
                              leading: CircleAvatar(
                                backgroundImage: MemoryImage(const Base64Decoder().convert(data.imagString)),
                                radius: 25,
                                backgroundColor: Colors.black,
                              ),
                              title:Text(data.name,style: const TextStyle(fontSize: 20,color: Colors.white),) ,
                              subtitle:  Text(data.age),
                              trailing: IconButton(onPressed: (){ value.delete(data, index);
                             
                              }, icon:const  Icon(Icons.delete)),
                             
                            ),
                          ),
                        );
                      }),
                      itemCount: value.studentList.length,
                );
                   }
                 ),
              ),
            
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddStudent(),)); },
          child: const Icon(Icons.add),
        ));
  }
}
