import 'package:flutter/material.dart';
import 'package:test_project/data/cases/case_data.dart';
import 'package:test_project/presentations/cases_presentation/info_cases_page.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({super.key});

  @override
  State<CasesPage> createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  late Future<List<Case>> caseList;

  @override
  void initState() {
    super.initState();
    caseList = getCasesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts Module'),
      ),
      body: FutureBuilder<List<Case>>(
        future: caseList,
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
                              InfoCasesPage(cases: snapshot.data![index]),
                        ),
                      );
                    },
                    title: Text(snapshot.data![index].title),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Completed: ${snapshot.data![index].completed}",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: snapshot.data![index].completed
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("User Id :${snapshot.data![index].userId}"),
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
