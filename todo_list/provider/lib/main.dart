import 'package:flutter/material.dart';

import 'package:todo_list/providers/todo_list_provider.dart';
import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return TodoListProvider(
      child: MaterialApp(
        title: 'Todo List',
        initialRoute: '/',
        routes: {
          '/': (context) => ListScreen(),
          '/form': (context) => FormScreen(),
        },
      ),
    );
  }
}
