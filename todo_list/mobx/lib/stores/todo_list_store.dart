import 'package:mobx/mobx.dart';

import 'package:todo_list/models/todo.dart';

// generated from `flutter packages pub run build_runner build` command
part 'todo_list_store.g.dart';

class TodoListStore = _TodoListStore with _$TodoListStore;

abstract class _TodoListStore with Store {
  int _currentTodoId = 1;

  @observable
  ObservableList<Todo> items = ObservableList<Todo>();

  @action
  void createItem(String text) {
    Todo newTodo = Todo(id: _currentTodoId, text: text);
    items.add(newTodo);
    _currentTodoId++;
  }

  @action
  void updateItem(int id, {String? text, bool? isDone}) {
    int index = items.indexWhere((element) => element.id == id);
    items[index] = Todo(
      id: id,
      text: text ?? items[index].text,
      isDone: isDone ?? items[index].isDone,
    );
  }

  @action
  void deleteItem(int id) {
    items.removeWhere((element) {
      return element.id == id;
    });
  }
}
