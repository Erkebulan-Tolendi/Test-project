import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/color/all_colors.dart';
import 'package:test_project/data/users/user_data.dart';
import 'package:test_project/presentations/user_presentation/info_user_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<User>>(
          create: (_) => getUsersList(),
          initialData: [],
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect().cproject,
          title: const Text('User Module'),
        ),
        body: Consumer<List<User>>(
          builder: (context, userList, child) {
            if (userList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoUserPage(user: userList[index]),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorSelect().cproject,
                        child: Text(
                          userList[index].name![0].toUpperCase(),
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
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
                        userList[index].name,
                        style: TextStyle(
                            color: ColorSelect().ctextT,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "email :${userList[index].email}",
                            style: TextStyle(color: ColorSelect().ctext),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Id : ${userList[index].id}",
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
