import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/stores/todo_list_store.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

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
