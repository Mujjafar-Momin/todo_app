import 'package:flutter/material.dart';
import 'package:todo_app/model/todo.dart';
import 'package:todo_app/widgets/todo_list.dart';

class Keys extends StatefulWidget {
  const Keys({Key? key}) : super(key: key);

  @override
  State<Keys> createState() => _KeysState();
}

class _KeysState extends State<Keys> {
  var _order = 'asc';
  final _todo = [
    ToDo(text: "d", priority: Priority.urgent),
    ToDo(text: "b", priority: Priority.normal),
    ToDo(text: "c", priority: Priority.low),
  ];

  void _changeOrder() {
    setState(() {
      _order = _order == 'asc' ? 'desc' : 'asc';
    });
  }

  List<ToDo> get _orderToDos {
    final sortedTodos = List.of(_todo);
    sortedTodos.sort((a, b) {
      final bComesAfterA = a.text.compareTo(b.text);
      return _order == 'asc' ? bComesAfterA : -bComesAfterA;
    });
    return sortedTodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton.icon(
              onPressed: _changeOrder,
              icon: Icon(
                  _order == 'asc' ? Icons.arrow_downward : Icons.arrow_upward),
              label:
                  Text("Sort ${_order == 'asc' ? 'Descending' : 'Ascending'}"),
            ),
          ),
          Expanded(
              child: Column(
            children: [
              for (final todo in _orderToDos)
                ToDoList(text: todo.text, priority: todo.priority)
            ],
          ))
        ],
      ),
    );
  }
}
