import 'dart:convert';

import 'package:http/http.dart' as http;

class Album {
  final String userId;
  final String id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'] as String,
    );
  }
}

Future<List<Album>> getAlbumList() async {
  const url = 'https://jsonplaceholder.typicode.com/albums';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    Iterable jsonResponse = json.decode(response.body);
    List<Album> album =
        jsonResponse.map((model) => Album.fromJson(model)).toList();
    return album;
  } else {
    throw Exception("Failed on load");
  }
}
