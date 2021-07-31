import 'package:flutter/material.dart';

import 'package:todo_list/providers/todo_list_provider.dart';
import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

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
