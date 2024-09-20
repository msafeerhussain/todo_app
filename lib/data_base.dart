import 'package:hive_flutter/hive_flutter.dart';

class ToDODataBase {
  List todoList = [];
  final _myBox = Hive.box("mybox"); // Use the correct box name here

  void createInitialData() {
    todoList = [

    ];
  }

  // Load the data from the database
  void loadData() {
    todoList = _myBox.get("TODOLIST");
  }

  // Update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}