import 'package:flutter/material.dart';

import '../../data/users/user_data.dart';

class InfoUserPage extends StatelessWidget {
  final User user;

  InfoUserPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Icon(
              Icons.supervised_user_circle_outlined,
              size: 70,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                'Name: ${user.name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('User Id: ${user.id}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Description: ${user.email}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Description: ${user.phone}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                  'Addres: city ${user.address.city}, geo lat ${user.address.geo.lat}, geo lng ${user.address.geo.lng}, street ${user.address.street}, suite ${user.address.suite}, zipcode ${user.address.zipcode}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('User Name: ${user.username}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('Website: ${user.website}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                  'Company: name ${user.company.name}, bs ${user.company.bs}, catch phrase ${user.company.catchPhrase}',
                  style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ]),
    );
  }
}
