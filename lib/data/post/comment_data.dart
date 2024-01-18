import 'dart:convert';

import 'package:http/http.dart' as http;

class Comment {
  final String postId;
  final String id;
  final String name;
  final String email;
  final String body;

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      postId: json["postId"].toString(),
      id: json["id"].toString(),
      name: json["name"] as String,
      email: json["email"] as String,
      body: json["body"] as String,
    );
  }
}

Future<List<Comment>> getCommentsForPost(String postId) async {
  final url = 'https://jsonplaceholder.typicode.com/comments?postId=$postId';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    return data.map((commentJson) => Comment.fromJson(commentJson)).toList();
  } else {
    throw Exception("Error: ${response.reasonPhrase}");
  }
}
