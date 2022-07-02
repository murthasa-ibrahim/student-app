
import 'package:flutter/material.dart';

class NameCard extends StatelessWidget {
  const NameCard({Key? key, required this.data, required this.item})
      : super(key: key);
  final String data;
  final String item;
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
