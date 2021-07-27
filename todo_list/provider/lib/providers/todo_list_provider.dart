import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:todo_list/models/todo.dart';

class TodoList extends ChangeNotifier {
  final List<Todo> _items = [];
  int currentTodoId = 1;

  List<Todo> get items => _items;

  void create(String text) {
    Todo newTodo = Todo(id: currentTodoId, text: text);
    _items.add(newTodo);
    currentTodoId++;

    notifyListeners();
  }

  void update(int id, {String? text, bool? isDone}) {
    _items.forEach((element) {
      if (element.id == id) {
        if (text != null) element.text = text;
        if (isDone != null) element.isDone = isDone;
      }
    });

    notifyListeners();
  }

  void delete(int id) {
    _items.removeWhere((element) {
      return element.id == id;
    });

    notifyListeners();
  }
}

class TodoListProvider extends StatelessWidget {
  final Widget? child;

  const TodoListProvider({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoList(),
      child: child,
    );
  }
}

class TodoListCustomer extends StatelessWidget {
  final Widget Function(
    BuildContext context,
    TodoList todoList,
    Widget? child,
  ) builder;

  const TodoListCustomer({Key? key, required this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoList>(builder: builder);
  }
}
