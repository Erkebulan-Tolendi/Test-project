import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/color/all_colors.dart';
import 'package:test_project/data/cases/case_data.dart';
import 'package:test_project/presentations/cases_presentation/info_cases_page.dart';

class CasesPage extends StatefulWidget {
  const CasesPage({Key? key});

  @override
  State<CasesPage> createState() => _CasesPageState();
}

class _CasesPageState extends State<CasesPage> {
  late Future<List<Case>> caseList;
  String filterValue = "all";

  @override
  void initState() {
    super.initState();
    caseList = getCasesList();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<Case>>(
          create: (_) => getCasesList(),
          initialData: [],
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorSelect().cproject,
          title: const Text('Cases Module'),
          actions: [
            PopupMenuButton(
              icon: Container(
                height: 30,
                width: 30,
                child: Icon(Icons.filter_list_outlined),
              ),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("True"),
                  value: "true",
                ),
                PopupMenuItem(
                  child: Text("False"),
                  value: "false",
                ),
                PopupMenuItem(
                  child: Text("All"),
                  value: "all",
                ),
              ],
              onSelected: (value) {
                setState(() {
                  filterValue = value.toString();
                });
              },
            ),
          ],
        ),
        body: Consumer<List<Case>>(
          builder: (context, caseList, child) {
            if (caseList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<Case> filteredList = caseList.where((caseItem) {
                if (filterValue == "all") {
                  return true;
                } else {
                  return caseItem.completed == (filterValue == "true");
                }
              }).toList();

              return ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                InfoCasesPage(cases: filteredList[index]),
                          ),
                        );
                      },
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
                        filteredList[index].title,
                        style: TextStyle(
                            color: ColorSelect().ctextT,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Completed: ${filteredList[index].completed}",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: filteredList[index].completed
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Id :${filteredList[index].id}",
                              style: TextStyle(
                                color: ColorSelect().ctext,
                              )),
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
