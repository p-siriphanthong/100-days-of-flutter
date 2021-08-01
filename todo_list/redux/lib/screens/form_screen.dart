import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:todo_list/models/todo.dart';
import 'package:todo_list/models/app_state.dart';
import 'package:todo_list/actions/todo_list_action.dart' as TodoListActions;

class FormScreenArguments {
  final Todo? todo;

  FormScreenArguments({this.todo});
}

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as FormScreenArguments;
    Todo? todo = args.todo;
    bool _isEditing = todo != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Todo' : 'Create Todo'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StoreConnector(converter: (Store<AppState> store) {
                return ({required String text}) => store.dispatch(_isEditing
                    ? TodoListActions.UpdateItem(id: todo.id, text: text)
                    : TodoListActions.CreateItem(text: text));
              }, builder: (
                BuildContext context,
                void Function({required String text}) onSaved,
              ) {
                return TextFormField(
                  initialValue: todo?.text ?? '',
                  decoration: InputDecoration(
                    hintText: 'Your Todo',
                  ),
                  maxLength: 50,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill your todo';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _isSubmitting = true;
                    });

                    onSaved(text: value!);
                    Navigator.pop(context);
                  },
                );
              }),
              ElevatedButton(
                child: Text(
                  _isSubmitting
                      ? (_isEditing ? 'Updating' : 'Creating')
                      : (_isEditing ? 'Update' : 'Create'),
                ),
                onPressed: _isSubmitting
                    ? null
                    : () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
