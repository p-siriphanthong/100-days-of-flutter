import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:brainstorming_app/config.dart';
import 'package:brainstorming_app/models/idea.dart';

Future<List<Idea>> getIdeas() async {
  final response = await http.get(Uri.parse('$API_URL/ideas'));

  if (response.statusCode != 200) throw Exception('Failed to load ideas');

  List<dynamic> body = jsonDecode(response.body);
  List<Idea> ideas = [];

  body.forEach((element) {
    ideas.add(Idea.fromJson(element));
  });

  return ideas;
}
