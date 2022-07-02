import 'package:flutter/material.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({Key? key}) : super(key: key);

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
              ClipRRect(
                child: Image.asset(
                  'asset/image/man.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
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
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.teal)),
                      child: const Text('Gallery',
                          style: TextStyle(fontSize: 20, color: Colors.white))),
                ],
              ),
             const InputCard(hintText: 'Enter Name',),
              const InputCard(hintText: 'Age',),
               const InputCard(hintText: 'place',),
                const InputCard(hintText: 'Phone',),
            
              TextButton(
                  onPressed: () {},
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
}

class InputCard extends StatelessWidget {
  const InputCard({
    Key? key, required this.hintText
  }) : super(key: key);
 final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
            hintText: hintText,
            fillColor: Colors.teal,
            border:const  OutlineInputBorder()),
      ),
    );
  }
}


