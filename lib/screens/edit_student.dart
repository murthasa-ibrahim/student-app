import 'package:flutter/material.dart';
import '../my widgets/widgets.dart';

class EditStudent extends StatelessWidget {
  const EditStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Edit Details 🧑',
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
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
      ));
  }
}