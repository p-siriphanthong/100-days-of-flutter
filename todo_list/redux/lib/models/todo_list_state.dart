import 'package:todo_list/models/todo.dart';

class TodoListState {
  final List<Todo> items;
  final int currentTodoId;

  const TodoListState({
    this.items = const [],
    this.currentTodoId = 1,
  });
}
