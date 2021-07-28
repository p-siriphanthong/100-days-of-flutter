import 'package:get/get.dart';

import 'package:todo_list/models/todo.dart';

class TodoListController extends GetxController {
  RxList<Todo> _items = RxList<Todo>([]);
  int currentTodoId = 1;

  List<Todo> get items => [..._items];

  void createItem(String text) {
    Todo newTodo = Todo(id: currentTodoId, text: text);
    _items.add(newTodo);
    currentTodoId++;
  }

  void updateItem(int id, {String? text, bool? isDone}) {
    int index = _items.indexWhere((element) => element.id == id);
    _items[index] = Todo(
      id: id,
      text: text ?? _items[index].text,
      isDone: isDone ?? _items[index].isDone,
    );
  }

  void deleteItem(int id) {
    _items.removeWhere((element) {
      return element.id == id;
    });
  }
}
