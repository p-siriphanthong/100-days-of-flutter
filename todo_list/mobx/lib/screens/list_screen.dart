import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/stores/todo_list_store.dart';
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
    final TodoListStore _todoListStore = Provider.of<TodoListStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Create Todo',
        onPressed: () => navigateToCreateScreen(context),
      ),
      body: Observer(builder: (BuildContext context) {
        return ListView.separated(
          itemCount: _todoListStore.items.length,
          itemBuilder: (BuildContext context, int index) {
            return TodoItem(todo: _todoListStore.items[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0);
          },
        );
      }),
    );
  }
}
