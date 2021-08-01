import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/reducers/todo_list_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    todoList: todoListReducer(state.todoList, action),
  );
}
