import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/color/all_colors.dart';
import 'package:test_project/data/photo/photo_album_data.dart';
import 'package:test_project/presentations/album_presentation/info_album_page.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Album>>(
            create: (_) => getAlbumList(), initialData: [])
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect().cproject,
          title: Text("Album Module"),
        ),
        body: Consumer<List<Album>>(
          builder: (context, albumList, child) {
            if (albumList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                  itemCount: albumList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    InfoAlbumPage(album: albumList[index]),
                              ));
                        },
                        leading: Icon(
                          Icons.image_outlined,
                          color: ColorSelect().cproject,
                          size: 40,
                        ),
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
                          albumList[index].title,
                          style: TextStyle(
                              color: ColorSelect().ctextT,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Id: ${albumList[index].id}",
                              style: TextStyle(color: ColorSelect().ctext),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "User ID: ${albumList[index].userId}",
                              style: TextStyle(color: ColorSelect().ctext),
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
