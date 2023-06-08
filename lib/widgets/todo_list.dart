import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key, required this.text, required this.priority})
      : super(key: key);
  final String text;
  final Priority priority;

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    var icon = Icons.low_priority;

    if(widget.priority==Priority.urgent){
      icon = Icons.notifications_active;
    }
    if(widget.priority==Priority.low){
      icon = Icons.list;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          const SizedBox(
            width: 6,
          ),
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            widget.text,
          )
        ],
      ),
    );
  }
}
