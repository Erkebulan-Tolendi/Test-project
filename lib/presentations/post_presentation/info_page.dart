import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/color/all_colors.dart';
import 'package:test_project/data/post/comment_data.dart';
import 'package:test_project/data/post/posts_data.dart';

class InfoPage extends StatelessWidget {
  final Post post;

  InfoPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Comment>>(
          create: (_) => getCommentsForPost('${post.id}'),
          initialData: [],
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect().cproject,
          title: Text('Post'),
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Title: ${post.title}',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorSelect().ctextT),
                ),
                const SizedBox(height: 10),
                Text('User Id: ${post.userId}',
                    style: TextStyle(fontSize: 16, color: ColorSelect().ctext)),
                const SizedBox(height: 10),
                Text('Description: ${post.body}',
                    style: TextStyle(fontSize: 16, color: ColorSelect().ctext)),
                const SizedBox(height: 10),
                Text(
                  'Comments:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorSelect().ctextT),
                ),
                Consumer<List<Comment>>(
                  builder: (context, commentList, child) {
                    if (commentList.isEmpty) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: commentList
                            .map(
                              (comment) => Card(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                child: ListTile(
                                  title: Text(
                                    "Comment Id: ${comment.postId}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: ColorSelect().ctextT,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Id: ${comment.id}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: ColorSelect().ctextT,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Name: ${comment.name}",
                                        style: TextStyle(
                                            color: ColorSelect().ctext),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Email: ${comment.email}',
                                        style: TextStyle(
                                            color: ColorSelect().ctext),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Body: ${comment.body}',
                                        style: TextStyle(
                                            color: ColorSelect().ctext),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
