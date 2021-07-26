import 'package:flutter/material.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/todo_item.dart';

class ListScreen extends StatelessWidget {
  final List<Todo> todoList;

  const ListScreen({Key? key, required this.todoList}) : super(key: key);

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
        body: ListView.separated(
          itemCount: todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(todo: todoList[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0);
          },
        ));
  }
}
