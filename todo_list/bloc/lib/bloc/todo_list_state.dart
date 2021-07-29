part of 'todo_list_bloc.dart';

class TodoListState {
  final List<Todo> items;
  final int currentTodoId;

  TodoListState({required this.items, required this.currentTodoId});
}

class TodoListInitial extends TodoListState {
  TodoListInitial() : super(items: [], currentTodoId: 1);
}
