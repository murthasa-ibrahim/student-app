
import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
   NameCard({Key? key, required this.data, required this.item,})
      : super(key: key);
  final String data;
  final String item;
  // final TextEditingController textEditingController;
  
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              data,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }
}




class InputCard extends StatelessWidget {
  const InputCard({
    Key? key, required this.hintText,required this.controller
  }) : super(key: key);
 final String hintText;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        decoration:  InputDecoration(
            hintText: hintText,
            fillColor: Colors.teal,
            border:const  OutlineInputBorder()),
      ),
    );
  }
}


