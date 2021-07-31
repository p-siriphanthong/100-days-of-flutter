import 'package:flutter/material.dart';

import 'package:todo_list/screens/list_screen.dart';
import 'package:todo_list/screens/form_screen.dart';
import 'package:todo_list/models/todo.dart';

void main() => runApp(TodoApp());

class TodoApp extends StatefulWidget {
  TodoApp({Key? key}) : super(key: key);

  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Todo> todoList = [];
  int currentTodoId = 1;

  void createTodo(String text) {
    Todo newTodo = Todo(id: currentTodoId, text: text);
    todoList.add(newTodo);

    setState(() {
      todoList = todoList;
      currentTodoId++;
    });
  }

  void updateTodo(int id, {String? text, bool? isDone}) {
    todoList.forEach((element) {
      if (element.id == id) {
        if (text != null) element.text = text;
        if (isDone != null) element.isDone = isDone;
      }
    });

    setState(() {
      todoList = todoList;
    });
  }

  void deleteTodo(int id) {
    todoList.removeWhere((element) {
      return element.id == id;
    });

    setState(() {
      todoList = todoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      initialRoute: '/',
      routes: {
        '/': (context) {
          return ListScreen(
            todoList: todoList,
            updateTodo: updateTodo,
            deleteTodo: deleteTodo,
          );
        },
        '/form': (context) {
          return FormScreen(
            createTodo: createTodo,
            updateTodo: updateTodo,
          );
        }
      },
    );
  }
}
