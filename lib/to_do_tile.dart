import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String textName;
  final bool taskComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  TodoTile(
      {super.key,
      required this.deleteFunction,
      required this.onChanged,
      required this.textName,
      required this.taskComplete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: Colors.red.shade800,
              icon: Icons.delete,
          borderRadius: BorderRadius.circular(20),
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                textName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                  decoration: taskComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 3,
                ),
              ),
              Spacer(),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                    checkColor: Colors.red,
                    side: WidgetStateBorderSide.resolveWith(
                      (states) => BorderSide(
                        width: 2,
                        color: taskComplete
                            ? Colors.grey
                            : Colors.red.shade200,
                      ),
                    ),
                    activeColor: Colors.red.shade100,
                    value: taskComplete,
                    onChanged: onChanged),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.red.shade800,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
