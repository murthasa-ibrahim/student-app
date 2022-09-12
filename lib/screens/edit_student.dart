import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/providers/edti_provider.dart';
import 'package:getx_student_app/screens/hom.dart';
import 'package:provider/provider.dart';
import '../my widgets/widgets.dart';

class EditStudent extends StatefulWidget {
  const EditStudent({Key? key, required this.data}) : super(key: key);
  final StudentModel data;

  @override
  State<EditStudent> createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  @override
  void initState() {
    context.read<EditProvider>().onInit(widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final editProvider = context.read<EditProvider>();
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Edit Details 🧑',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            widget.data.imagString.isEmpty
                ? const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage('asset/image/userimage.jpg'))
                : CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.black,
                    backgroundImage: MemoryImage(
                        const Base64Decoder().convert(widget.data.imagString))),
            InputCard(
                hintText: widget.data.name,
                controller: editProvider.nameController),
            InputCard(
                hintText: widget.data.age,
                controller: editProvider.ageController),
            InputCard(
                hintText: widget.data.place,
                controller: editProvider.placeController),
            InputCard(
                hintText: widget.data.phone,
                controller: editProvider.phoneController),
            TextButton(
                onPressed: () {
                  editProvider.edit(widget.data);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ScreenHome()));
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
