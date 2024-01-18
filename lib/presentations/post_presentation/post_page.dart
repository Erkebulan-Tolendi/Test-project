import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/color/all_colors.dart';
import 'package:test_project/data/post/posts_data.dart';
import 'package:test_project/presentations/post_presentation/info_page.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Post>>(
            create: (_) => getPostsList(), initialData: [])
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect().cproject,
          title: const Text('Posts Module'),
        ),
        body: Consumer<List<Post>>(
          builder: (context, postList, child) {
            if (postList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoPage(post: postList[index]),
                          ),
                        );
                      },
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorSelect().cproject,
                          ),
                        ],
                      ),
                      title: Text(
                        postList[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorSelect().ctextT),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Id :${postList[index].id}",
                            style: TextStyle(color: ColorSelect().ctext),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Body: ${postList[index].body}",
                            style: TextStyle(color: ColorSelect().ctext),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
