import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:test_project/data/photo/photo_album_data.dart';
import 'package:test_project/data/photo/photos_data.dart';

class InfoAlbumPage extends StatelessWidget {
  final Album album;

  InfoAlbumPage({required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo page"),
      ),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "Title: ${album.title}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text("Id: ${album.id}"),
              const SizedBox(height: 10),
              Text("User Id: ${album.userId}"),
              const SizedBox(height: 10),
              Text(
                "Photos",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              FutureBuilder<List<Photo>>(
                  future: getPhotoList("${album.id}"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Column(
                          children: snapshot.data!
                              .map(
                                (photo) => InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InstaImageViewer(
                                          child: Image.network(
                                            "${photo.url}",
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Card(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: ListTile(
                                      leading: Image.network(
                                        "${photo.thumbnailUrl}",
                                      ),
                                      title: Text(
                                        "Title: ${photo.title}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                              .toList());
                    }
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
