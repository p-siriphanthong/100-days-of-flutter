import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/widgets/todo_item.dart';
import 'package:todo_list/controllers/todo_list.dart';

class ListScreen extends StatelessWidget {
  final TodoListController todoList = Get.put(TodoListController());

  ListScreen({Key? key}) : super(key: key);

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
      body: Obx(
        () => ListView.separated(
          itemCount: todoList.items.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(todo: todoList.items[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0);
          },
        ),
      ),
    );
  }
}
