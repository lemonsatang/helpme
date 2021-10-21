import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const NKFlutter());
}

class NKFlutter extends StatelessWidget {
  const NKFlutter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const SJMain(title: '수주'),
      debugShowCheckedModeBanner: false,
    );
  }
}

final List<Tab> Tabs = <Tab>[
  Tab(text: '수주내역'),
  Tab(text: '견적'),
];

class SJMain extends StatefulWidget {
  const SJMain({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SJMain> createState() => _SJMainState();
}

class _SJMainState extends State<SJMain> {
  Future getData() async {
    try {
      var url = 'http://192.168.0.191/read.php';
      var response = await http.get(url);
      return json.decode(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Tabs.length,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: AppBar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text('임시제목'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: TabBar(
                indicatorColor: Colors.green,
                labelColor: Colors.green,
                tabs: Tabs,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return ListTile(
                            leading: InkWell(
                              child: Icon(Icons.edit),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddEditPage(
                                      list: list,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                            title: Text(list[index]['COMP']),
                            subtitle: Text(list[index]['C_CODE']),
                            trailing: InkWell(
                              child: Icon(Icons.delete),
                              onTap: () {
                                setState(
                                  () {
                                    var url = 'http://192.168.0.191/delete.php';
                                    http.post(
                                      url,
                                      body: {
                                        'id': list[index]['ID'],
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        })
                    : CircularProgressIndicator();
              },
            ),
            Center(
              child: Text('사람살려'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddEditPage(
                  list: [],
                  index: -1,
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: '관리메뉴',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'My',
            ),
          ],
        ),
      ),
    );
  }
}
