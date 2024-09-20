import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/theme.dart';
import 'package:todo/to_do_list.dart';



void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColor: primaryColor, // Use primaryColor from theme.dart
        scaffoldBackgroundColor: primaryColor,
      ),

      home: const TodoList(),
    );
  }
}
