import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/store/store.dart';
import 'package:todo_list/models/app_state.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatelessWidget {
  final Store<AppState> store = createStore();

  TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
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
