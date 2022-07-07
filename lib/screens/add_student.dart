
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:getx_student_app/controller/provider.dart';
import 'package:getx_student_app/models/hive_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../my widgets/widgets.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key, }) : super(key: key);
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final placeController = TextEditingController();
  final phoneController = TextEditingController();

  File? imagefile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Student'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              Consumer<ProviderModel>(
                
                builder: (context, value, child)  {
                  String imageString= value.imageString;
                  return ClipOval(
                    child: SizedBox.fromSize(
                        size:const Size.fromRadius(48), 
                         child:imageString.isEmpty?
                             Image.asset(
                                'asset/image/man.jpg',
                                width: 20,
                                height: 20,
                                fit: BoxFit.cover,
                              ): Image.memory(base64Decode(imageString))
                            
                              ),
                  );
                }
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        _chosePick(ImageSource.camera,context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      child: const Text(
                        'Camera',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                  const SizedBox(
                    width: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        _chosePick(ImageSource.gallery,context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      child: const Text('Gallery',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ],
              ),
              InputCard(
                controller: nameController,
                hintText: 'Enter Name',
              ),
              InputCard(
                
                controller: ageController,
                hintText: 'Age',
              ),
              InputCard(
                controller: placeController,
                hintText: 'place',
              ),
              InputCard(
                controller: phoneController,
                hintText: 'Phone',
              ),
              TextButton(
                  onPressed: () {
                    _onButtonClick(context);
                      Navigator.of(context).pop();
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
      ),
    );
  }

  void _chosePick(source,BuildContext context) async {
    final XFile? image = await ImagePicker().pickImage(source: source);
    if (image != null) {
     imagefile = File(image.path);
    ProviderModel controller =  Provider.of<ProviderModel>(context,listen: false);
    controller.addImage(image);
      
    }
  }

  void _onButtonClick( BuildContext context) {
    ProviderModel controller = Provider.of<ProviderModel>(context,listen: false);
    final name = nameController.text;
    final age = ageController.text;
    final place = placeController.text;
    final phone = phoneController.text;

    if (name.isEmpty || age.isEmpty || place.isEmpty || phone.isEmpty) {
      return;
    }

    final student = StudentModel(
        name: name,
        age: age,
        place: place,
        phone: phone,
        imagString: controller.imageString);
    controller.addStudent(student);
    

  }


  
}
