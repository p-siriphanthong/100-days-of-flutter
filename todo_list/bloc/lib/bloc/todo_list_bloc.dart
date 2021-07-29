import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_list/models/todo.dart';

part 'todo_list_event.dart';
part 'todo_list_state.dart';

class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  TodoListBloc() : super(TodoListInitial());

  @override
  Stream<TodoListState> mapEventToState(TodoListEvent event) async* {
    List<Todo> items = state.items;
    int currentTodoId = state.currentTodoId;

    if (event is TodoListAddItemEvent) {
      Todo newTodo = Todo(id: state.currentTodoId, text: event.text);
      items.add(newTodo);
      currentTodoId++;
    } else if (event is TodoListUpdateItemEvent) {
      int index = items.indexWhere((element) => element.id == event.id);
      items[index] = Todo(
        id: event.id,
        text: event.text ?? items[index].text,
        isDone: event.isDone ?? items[index].isDone,
      );
    } else if (event is TodoListDeleteItemEvent) {
      items.removeWhere((element) => element.id == event.id);
    }

    yield TodoListState(items: items, currentTodoId: currentTodoId);
  }
}
