import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/stores/todo_list_store.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoListStore>(
      create: (BuildContext context) => TodoListStore(),
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
