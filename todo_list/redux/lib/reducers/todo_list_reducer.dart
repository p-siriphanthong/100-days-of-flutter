import 'package:redux/redux.dart';

import 'package:todo_list/models/todo.dart';
import 'package:todo_list/models/todo_list_state.dart';
import 'package:todo_list/actions/todo_list_action.dart' as TodoListActions;

final todoListReducer = combineReducers<TodoListState>([
  TypedReducer<TodoListState, TodoListActions.CreateItem>(_createItem),
  TypedReducer<TodoListState, TodoListActions.UpdateItem>(_updateItem),
  TypedReducer<TodoListState, TodoListActions.DeleteItem>(_deleteItem),
]);

TodoListState _createItem(
  TodoListState state,
  TodoListActions.CreateItem action,
) {
  List<Todo> todoList = [...state.items];
  Todo newTodo = Todo(id: state.currentTodoId, text: action.text);
  todoList.add(newTodo);

  return TodoListState(
    items: todoList,
    currentTodoId: state.currentTodoId + 1,
  );
}

TodoListState _updateItem(
  TodoListState state,
  TodoListActions.UpdateItem action,
) {
  state.items.forEach((element) {
    if (element.id == action.id) {
      if (action.text != null) element.text = action.text!;
      if (action.isDone != null) element.isDone = action.isDone!;
    }
  });

  return TodoListState(
    items: state.items,
    currentTodoId: state.currentTodoId,
  );
}

TodoListState _deleteItem(
  TodoListState state,
  TodoListActions.DeleteItem action,
) {
  state.items.removeWhere((element) {
    return element.id == action.id;
  });

  return TodoListState(
    items: state.items,
    currentTodoId: state.currentTodoId,
  );
}
