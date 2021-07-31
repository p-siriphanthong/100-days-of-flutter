import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/stores/todo_list_store.dart';
import 'package:todo_list/widgets/delete_dialog.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({Key? key, required this.todo}) : super(key: key);

  void navigateToEditScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/form',
      arguments: FormScreenArguments(todo: todo),
    );
  }

  void _delete(BuildContext context, void Function(int id) deleteTodo) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DeleteDialog(
        title: 'Do you want to delete the todo\n"${todo.text}"?',
        onDelete: () {
          deleteTodo(todo.id);
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
        onCancel: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final TodoListStore _todoListStore = Provider.of<TodoListStore>(context);

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: CheckboxListTile(
        title: Text(
          todo.text,
          style: todo.isDone
              ? TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        value: todo.isDone,
        onChanged: (bool? value) =>
            _todoListStore.updateItem(todo.id, isDone: value!),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () => navigateToEditScreen(context),
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          onTap: () => _delete(context, _todoListStore.deleteItem),
        ),
      ],
    );
  }
}
