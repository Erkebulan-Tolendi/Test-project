import 'package:flutter/material.dart';
import 'package:test_project/data/post/comment_data.dart';
import 'package:test_project/data/post/posts_data.dart';

class InfoPage extends StatelessWidget {
  final Post post;

  InfoPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Title: ${post.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('User Id: ${post.userId}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Description: ${post.body}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                'Comments:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              FutureBuilder<List<Comment>>(
                future: getCommentsForPost('${post.id}'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: snapshot.data!
                          .map(
                            (comment) => Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                title: Text(
                                  "Post Id: ${comment.postId}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Id: ${comment.id}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text("Name: ${comment.name}"),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Email: ${comment.email}'),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text('Body: ${comment.body}'),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  }
                  return Text('No comments available.');
                },
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
