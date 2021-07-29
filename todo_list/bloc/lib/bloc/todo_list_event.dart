part of 'todo_list_bloc.dart';

@immutable
abstract class TodoListEvent {}

class TodoListAddItemEvent extends TodoListEvent {
  final String text;

  TodoListAddItemEvent({required this.text});
}

class TodoListUpdateItemEvent extends TodoListEvent {
  final int id;
  final String? text;
  final bool? isDone;

  TodoListUpdateItemEvent({required this.id, this.text, this.isDone});
}

class TodoListDeleteItemEvent extends TodoListEvent {
  final int id;

  TodoListDeleteItemEvent({required this.id});
}
