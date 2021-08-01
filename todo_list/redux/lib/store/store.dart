import 'package:redux/redux.dart';

import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/reducers/app_reducer.dart';

Store<AppState> createStore() {
  Store<AppState> store = new Store(
    appReducer,
    initialState: new AppState(),
  );

  return store;
}
