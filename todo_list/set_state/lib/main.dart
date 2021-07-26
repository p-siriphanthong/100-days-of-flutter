import 'package:flutter/material.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/todo.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todoList = [
    // TODO: remove initial value
    Todo(id: 1, text: 'Buy milk', isDone: false),
    Todo(id: 2, text: 'Buy eggs', isDone: true),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      initialRoute: '/',
      routes: {
        '/': (context) => ListScreen(todoList: todoList),
        '/form': (context) => FormScreen(),
      },
    );
  }
}
