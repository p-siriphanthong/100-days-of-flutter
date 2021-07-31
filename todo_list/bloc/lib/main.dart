import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoListBloc>(
      create: (BuildContext context) => TodoListBloc(),
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
