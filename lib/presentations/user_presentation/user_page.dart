import 'package:flutter/material.dart';
import 'package:test_project/presentations/user_presentation/info_user_page.dart';

import '../../data/users/user_data.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late Future<List<User>> userList;

  @override
  void initState() {
    super.initState();
    userList = getUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Module'),
      ),
      body: FutureBuilder<List<User>>(
        future: userList,
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
                              InfoUserPage(user: snapshot.data![index]),
                        ),
                      );
                    },
                    leading: Icon(Icons.supervised_user_circle_outlined),
                    title: Text(snapshot.data![index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("email :${snapshot.data![index].email}"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text("Id : ${snapshot.data![index].id}"),
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
