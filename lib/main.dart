import 'package:flutter/material.dart';
import 'package:getx_student_app/controller/provider.dart';
import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/screens/hom.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  // if ( !Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
  //      Hive.registerAdapter(StudentModelAdapter());
  //  }
  if(!Hive.isAdapterRegistered(StudentModelAdapter().typeId)){
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>  ProviderModel(),
      child: MaterialApp(
        title: 'Student app',
         debugShowCheckedModeBanner: false,
        theme: ThemeData(
       
          primarySwatch: Colors.teal,
          
        ),
        home: ScreenHome(),
      
      ),
    );
  }
}
