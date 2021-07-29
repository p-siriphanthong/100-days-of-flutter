import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/widgets/todo_item.dart';
import 'package:todo_list/bloc/todo_list_bloc.dart';

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
    TodoListBloc _todoListBloc = BlocProvider.of<TodoListBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Create Todo',
        onPressed: () => navigateToCreateScreen(context),
      ),
      body: BlocBuilder<TodoListBloc, TodoListState>(
        bloc: _todoListBloc,
        builder: (BuildContext context, TodoListState state) {
          return ListView.separated(
            itemCount: state.items.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(todo: state.items[index]);
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
