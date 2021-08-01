import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  void navigateToCreateScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/form',
      arguments: FormScreenArguments(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Create Todo',
        onPressed: () => navigateToCreateScreen(context),
      ),
      body: StoreConnector(
        converter: (Store<AppState> store) => store.state.todoList.items,
        builder: (BuildContext context, List<Todo> todoList) {
          return ListView.separated(
            itemCount: todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(todo: todoList[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 0);
            },
          );
        },
      ),
    );
  }
}
