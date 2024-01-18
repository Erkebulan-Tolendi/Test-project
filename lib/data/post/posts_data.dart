import 'dart:convert';

import 'package:http/http.dart' as http;

class Post {
  final String userId;
  final String id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

Future<List<Post>> getPostsList() async {
  const url = 'https://jsonplaceholder.typicode.com/posts';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Iterable jsonResponse = json.decode(response.body);
    List<Post> posts =
        jsonResponse.map((model) => Post.fromJson(model)).toList();
    return posts;
  } else {
    throw Exception('Failed to load posts');
  }
}
