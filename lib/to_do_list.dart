import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/Alert_Dialog.dart';
import 'package:todo/data_base.dart';
import 'package:todo/to_do_tile.dart';


class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final _myBox = Hive.box("mybox");
  ToDODataBase db =ToDODataBase();

  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();
    }else{
      db.loadData();
    }
    super.initState();
  }
   final _controller = TextEditingController();
  // list of to-do tasks

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }
 void saveNewTask(){
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
 }
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return AlertDialogScreen(
        onSave: saveNewTask,
              controller: _controller,
        onCancel: () => Navigator.of(context).pop(),
      );
    },);
  }
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red.shade800,
          child: Icon(Icons.add, color: Colors.white, size: 30),
          onPressed: createNewTask),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red.shade800,
        title: Text(
          "TO-DO",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            deleteFunction: (context) => deleteTask(index),
            textName: db.todoList[index][0],
            taskComplete: db.todoList[index][1],
            onChanged: (p0) => checkBoxChanged(p0, index),
          );
        },
      ),
    );
  }
}
