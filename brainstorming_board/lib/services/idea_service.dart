import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:brainstorming_board/config.dart';
import 'package:brainstorming_board/models/idea.dart';

Future<List<Idea>> getIdeas() async {
  late http.Response? response;

  try {
    response = await http.get(Uri.parse('$API_URL/ideas'));
  } catch (err) {
    return Future.error('Cannot connect to server');
  }

  if (response.statusCode != 200) {
    return Future.error('Error: ${response.statusCode}');
  }

  List<dynamic> body = jsonDecode(response.body);
  List<Idea> ideas = [];

  body.forEach((element) {
    ideas.add(Idea.fromJson(element));
  });

  return ideas;
}

Future<Idea> createIdea(String text) async {
  late http.Response? response;

  try {
    response = await http.post(
      Uri.parse('$API_URL/ideas'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'text': text,
      }),
    );
  } catch (err) {
    return Future.error('Cannot connect to server');
  }

  if (response.statusCode != 201) {
    return Future.error('Error: ${response.statusCode}');
  }

  return Idea.fromJson(jsonDecode(response.body));
}
