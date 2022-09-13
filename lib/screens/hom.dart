import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getx_student_app/providers/home_provider.dart';
import 'package:getx_student_app/screens/add_student.dart';
import 'package:getx_student_app/screens/search.dart';
import 'package:getx_student_app/screens/student_details.dart';
import 'package:provider/provider.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<HomeProvider>().getAllStudent();
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student App',
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: Consumer<HomeProvider>(builder: (ctx, provider, child) {
                return (provider.studentList.isEmpty)
                    ? Center(
                        child: ShaderMask(
                          shaderCallback: (bounds) {
                            return const RadialGradient(
                              center: Alignment.topLeft,
                              radius: 1.0,
                              colors: <Color>[Colors.teal, Colors.yellow],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: const Text(
                            'Add New Student',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : Scrollbar(
                        thumbVisibility: true,
                        controller: provider.firstController,
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            final data = provider.studentList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.teal,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) =>
                                          StudentDetails(details: data),
                                    ));
                                  },
                                  leading: data.imagString.isEmpty
                                      ? const CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.black,
                                          backgroundImage: AssetImage(
                                              'asset/image/userimage.jpg'))
                                      : CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.black,
                                          backgroundImage: MemoryImage(
                                              const Base64Decoder()
                                                  .convert(data.imagString))),
                                  title: Text(
                                    data.name,
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                  subtitle: Text(data.age),
                                  trailing: IconButton(
                                      onPressed: () {
                                        provider.delete(data, index);
                                      },
                                      icon: const Icon(Icons.delete)),
                                ),
                              ),
                            );
                          }),
                          itemCount: provider.studentList.length,
                        ),
                      );
              }),
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<HomeProvider>().clear();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AddStudent(),
            ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
