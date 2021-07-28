import 'package:flutter/material.dart';

import 'package:todo_list/models/todo.dart';

class FormScreenArguments {
  final Todo? todo;

  FormScreenArguments({this.todo});
}

class FormScreen extends StatefulWidget {
  final String? id;
  final void Function(String text) createTodo;
  final void Function(int id, {String text}) updateTodo;

  const FormScreen({
    Key? key,
    this.id,
    required this.createTodo,
    required this.updateTodo,
  }) : super(key: key);

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
              TextFormField(
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

                  if (_isEditing) {
                    widget.updateTodo(todo.id, text: value!);
                  } else {
                    widget.createTodo(value!);
                  }

                  Navigator.pop(context);
                },
              ),
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
