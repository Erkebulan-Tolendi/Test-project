import 'package:flutter/material.dart';
import 'package:test_project/color/all_colors.dart';
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
    return Scaffold(
      body: scrrens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: ColorSelect().cproject,
          indicatorColor: ColorSelect().cbuttons,
          labelTextStyle: MaterialStateProperty.all(TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: ColorSelect().cnavBut)),
        ),
        child: NavigationBar(
          height: 60,
          selectedIndex: index,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          animationDuration: Duration(seconds: 1),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.post_add,
                color: ColorSelect().cnavBut,
              ),
              label: "Post",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.cases_rounded,
                color: ColorSelect().cnavBut,
              ),
              label: "Cases",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.photo_album_outlined,
                color: ColorSelect().cnavBut,
              ),
              label: "Album",
            ),
            NavigationDestination(
              icon: Icon(
                Icons.supervised_user_circle_outlined,
                color: ColorSelect().cnavBut,
              ),
              label: "User",
            ),
          ],
        ),
      ),
    );
  }
}
