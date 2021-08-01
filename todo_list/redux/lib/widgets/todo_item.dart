import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/models/todo.dart';
import 'package:todo_list/widgets/delete_dialog.dart';
import 'package:todo_list/actions/todo_list_action.dart' as TodoListActions;

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

  void _delete(BuildContext context, void Function() onDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) => DeleteDialog(
        title: 'Do you want to delete the todo\n"${todo.text}"?',
        onDelete: () {
          onDelete();
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
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: StoreConnector(
        converter: (Store<AppState> store) {
          return ({required bool isDone}) => store.dispatch(
              TodoListActions.UpdateItem(id: todo.id, isDone: isDone));
        },
        builder: (
          BuildContext context,
          void Function({required bool isDone}) updateTodo,
        ) {
          return CheckboxListTile(
            title: Text(
              todo.text,
              style: todo.isDone
                  ? TextStyle(decoration: TextDecoration.lineThrough)
                  : null,
            ),
            value: todo.isDone,
            onChanged: (bool? value) => updateTodo(isDone: value!),
          );
        },
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Edit',
          color: Colors.blue,
          icon: Icons.edit,
          onTap: () => navigateToEditScreen(context),
        ),
        StoreConnector(converter: (Store<AppState> store) {
          return () => store.dispatch(TodoListActions.DeleteItem(id: todo.id));
        }, builder: (
          BuildContext context,
          void Function() deleteTodo,
        ) {
          return IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => _delete(context, deleteTodo),
          );
        }),
      ],
    );
  }
}
