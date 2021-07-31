// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoListStore on _TodoListStore, Store {
  final _$itemsAtom = Atom(name: '_TodoListStore.items');

  @override
  ObservableList<Todo> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Todo> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$_TodoListStoreActionController =
      ActionController(name: '_TodoListStore');

  @override
  void createItem(String text) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.createItem');
    try {
      return super.createItem(text);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateItem(int id, {String? text, bool? isDone}) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.updateItem');
    try {
      return super.updateItem(id, text: text, isDone: isDone);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteItem(int id) {
    final _$actionInfo = _$_TodoListStoreActionController.startAction(
        name: '_TodoListStore.deleteItem');
    try {
      return super.deleteItem(id);
    } finally {
      _$_TodoListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
