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
      var url = 'http://121.158.192.235/read.php';
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
                          return InkWell(
                            splashColor: Colors.green,
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
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                // tileColor: Colors.white,
                                // title: Text(list[index]['COMP']),
                                // subtitle: Text(list[index]['C_CODE']),
                                contentPadding: EdgeInsets.all(15.0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '거래처명',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          list[index]['COMP'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          list[index]['CDATE'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '등록자 : ' + list[index]['USRNM'],
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '전표번호 : ' + list[index]['C_CODE'],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: InkWell(
                                  child: Icon(Icons.delete),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('삭제 경고'),
                                          content: Text('이 아이템을 정말로 삭제하시겠습니까?'),
                                          actions: [
                                            TextButton(
                                              child: Text('삭제'),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    var url =
                                                        'http://121.158.192.235/delete.php';
                                                    http.post(
                                                      url,
                                                      body: {
                                                        'id': list[index]['ID'],
                                                      },
                                                    );
                                                  },
                                                );
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text('취소'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            FutureBuilder(
              future: getData(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return InkWell(
                            splashColor: Colors.green,
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
                            child: Card(
                              color: Colors.white,
                              child: ListTile(
                                // tileColor: Colors.white,
                                // title: Text(list[index]['COMP']),
                                // subtitle: Text(list[index]['C_CODE']),
                                contentPadding: EdgeInsets.all(15.0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '거래처명',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          list[index]['COMP'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          list[index]['CDATE'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                subtitle: Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '등록자 : ' + list[index]['USRNM'],
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '전표번호 : ' + list[index]['C_CODE'],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                trailing: InkWell(
                                  child: Icon(Icons.delete),
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('삭제 경고'),
                                          content: Text('이 아이템을 정말로 삭제하시겠습니까?'),
                                          actions: [
                                            TextButton(
                                              child: Text('삭제'),
                                              onPressed: () {
                                                setState(
                                                  () {
                                                    var url =
                                                        'http://121.158.192.235/delete.php';
                                                    http.post(
                                                      url,
                                                      body: {
                                                        'id': list[index]['ID'],
                                                      },
                                                    );
                                                  },
                                                );
                                                Navigator.pop(context);
                                              },
                                            ),
                                            TextButton(
                                              child: Text('취소'),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
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
          selectedItemColor: Colors.green[700],
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
