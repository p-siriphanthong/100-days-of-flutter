import 'package:flutter/material.dart';

import 'package:todo_list/providers/todo_list_provider.dart';
import 'package:todo_list/screens/form_screen.dart';
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
      body: TodoListCustomer(builder: (context, todoList, child) {
        return ListView.separated(
          itemCount: todoList.items.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(todo: todoList.items[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0);
          },
        );
      }),
    );
  }
}
