import 'dart:convert';

import 'package:http/http.dart' as http;

class Photo {
  final String albumId;
  final String id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'].toString(),
      id: json['id'].toString(),
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}

Future<List<Photo>> getPhotoList(String albumId) async {
  final url = 'https://jsonplaceholder.typicode.com/photos?albumId=$albumId';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final List<dynamic> photo = json.decode(response.body);
    return photo.map((photoJson) => Photo.fromJson(photoJson)).toList();
  } else {
    throw Exception("Has Error on load Photo");
  }
}
