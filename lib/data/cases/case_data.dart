import 'dart:convert';

import 'package:http/http.dart' as http;

class Case {
  final String userId;
  final String id;
  final String title;
  final bool completed;

  Case({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  factory Case.fromJson(Map<String, dynamic> json) {
    return Case(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );
  }
}

Future<List<Case>> getCasesList() async {
  final url = 'https://jsonplaceholder.typicode.com/todos';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Iterable jsonResponse = json.decode(response.body);
    List<Case> cases = jsonResponse.map((e) => Case.fromJson(e)).toList();
    return cases;
  } else {
    throw Exception("Error on loading");
  }
}
