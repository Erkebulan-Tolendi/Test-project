import 'package:flutter/material.dart';
import 'package:test_project/data/post/posts_data.dart';
import 'package:test_project/presentations/post_presentation/info_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  late Future<List<Post>> postsList;

  @override
  void initState() {
    super.initState();
    postsList = getPostsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Module'),
      ),
      body: FutureBuilder<List<Post>>(
        future: postsList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              InfoPage(post: snapshot.data![index]),
                        ),
                      );
                    },
                    title: Text(snapshot.data![index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("User Id :${snapshot.data![index].userId}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Body: ${snapshot.data![index].body}"),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
