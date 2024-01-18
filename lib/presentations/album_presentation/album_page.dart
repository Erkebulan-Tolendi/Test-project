import 'package:flutter/material.dart';
import 'package:test_project/data/photo/photo_album_data.dart';
import 'package:test_project/presentations/album_presentation/info_album_page.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> albumList;
  @override
  void initState() {
    albumList = getAlbumList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Album Page"),
      ),
      body: FutureBuilder<List<Album>>(
        future: albumList,
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
                                  InfoAlbumPage(album: snapshot.data![index]),
                            ));
                      },
                      title: Text(snapshot.data![index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Id: ${snapshot.data![index].id}"),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("User ID: ${snapshot.data![index].userId}")
                        ],
                      ),
                    ),
                  );
                });
          }
        },
      ),
    );
  }
}
