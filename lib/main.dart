import 'package:flutter/material.dart';
import 'package:getx_student_app/providers/edti_provider.dart';
import 'package:getx_student_app/providers/home_provider.dart';
import 'package:getx_student_app/models/hive_model.dart';
import 'package:getx_student_app/screens/hom.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<EditProvider>(
          create: (context) => EditProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: const ScreenHome(),
      ),
    );
  }
}
