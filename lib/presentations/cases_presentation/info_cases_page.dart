import 'package:flutter/material.dart';
import 'package:test_project/data/cases/case_data.dart';

class InfoCasesPage extends StatelessWidget {
  final Case cases;

  InfoCasesPage({required this.cases});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                'Title: ${cases.title}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('User Id: ${cases.userId}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text('User Id: ${cases.id}', style: TextStyle(fontSize: 16)),
              const SizedBox(height: 10),
              Text(
                "Completed: ${cases.completed}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cases.completed ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
