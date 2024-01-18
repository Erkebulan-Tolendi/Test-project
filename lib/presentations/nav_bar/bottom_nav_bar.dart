import 'package:flutter/material.dart';
import 'package:test_project/presentations/album_presentation/album_page.dart';
import 'package:test_project/presentations/cases_presentation/cases_page.dart';
import 'package:test_project/presentations/post_presentation/post_page.dart';
import 'package:test_project/presentations/user_presentation/user_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;

  final scrrens = [
    PostPage(),
    CasesPage(),
    AlbumPage(),
    UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: scrrens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            labelTextStyle: MaterialStateProperty.all(
                TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          child: NavigationBar(
            height: 60,
            selectedIndex: index,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            animationDuration: Duration(seconds: 1),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.post_add,
                ),
                label: "Post",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.cases_rounded,
                ),
                label: "Cases",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.photo_album_outlined,
                ),
                label: "Album",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.supervised_user_circle_outlined,
                ),
                label: "User",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
