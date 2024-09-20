import 'package:flutter/material.dart';
import 'package:todo/Button.dart';

class AlertDialogScreen extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   AlertDialogScreen({super.key,
     required this.onSave,
     required this.onCancel,
     this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.red.shade800,
      content: Container(
        height: 220,
        width: 290,
        decoration: BoxDecoration(
          color: Colors.red.shade800,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 10,),
            TextField(
              controller: controller,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: "Add New Task",
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontWeight: FontWeight.w400,
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Button(
                     onPressed: onSave, text: "Save"),
                Button(onPressed: onCancel, text: "Cancel"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
