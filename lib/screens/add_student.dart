import 'package:flutter/material.dart';
import 'package:getx_student_app/providers/home_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../my widgets/widgets.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
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
              Consumer<HomeProvider>(builder: (context, value, child) {
                // String imageString = value.imageString;
                return value.imagefile == null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset(
                          'asset/image/userimage.jpg',
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.file(
                          value.imagefile!,
                          fit: BoxFit.cover,
                          height: 150,
                          width: 150,
                        ));
              }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        homeProvider.chosePick(ImageSource.camera, context);
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
                        homeProvider.chosePick(ImageSource.gallery, context);
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      child: const Text('Gallery',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ],
              ),
              Form(
                key: homeProvider.formKey,
                child: Column(
                  children: [
                    InputCard(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                        }
                        return null;
                      },
                      controller: homeProvider.nameController,
                      hintText: 'Enter Name',
                    ),
                    InputCard(
                        controller: homeProvider.ageController,
                        hintText: 'Age',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'enter age';
                          }
                          return null;
                        }),
                    InputCard(
                      controller: homeProvider.placeController,
                      hintText: 'place',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter place ';
                        }
                        return null;
                      },
                    ),
                    InputCard(
                      controller: homeProvider.phoneController,
                      hintText: 'Phone',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'enter place ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    homeProvider.onButtonClick(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.teal)),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  )),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
