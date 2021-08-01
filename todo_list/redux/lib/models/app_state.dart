import 'package:todo_list/models/todo_list_state.dart';

class AppState {
  final TodoListState todoList;

  const AppState({
    this.todoList = const TodoListState(),
  });
}
