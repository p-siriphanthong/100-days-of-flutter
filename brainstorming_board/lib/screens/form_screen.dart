import 'package:flutter/material.dart';

import 'package:brainstorming_board/widgets/text_field.dart' as brainstorming;
import 'package:brainstorming_board/models/idea.dart';

class FormScreen extends StatefulWidget {
  final Future<Idea> Function(String text) onCreateIdea;

  const FormScreen({Key? key, required this.onCreateIdea}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmitting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Idea'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              brainstorming.TextField(
                hintText: 'Your Idea',
                isTextArea: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Please fill your idea';
                  }
                  return null;
                },
                onSaved: (String? value) {
                  setState(() {
                    _isSubmitting = true;
                  });

                  widget
                      .onCreateIdea(value!)
                      .whenComplete(() => Navigator.pop(context));
                },
              ),
              ElevatedButton(
                child: Text(_isSubmitting ? 'Creating' : 'Create'),
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
