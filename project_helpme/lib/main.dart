import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      ),
      home: const SJMain(title: '수주'),
    );
  }
}

class SJMain extends StatefulWidget {
  const SJMain({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<SJMain> createState() => _SJMainState();
}

class _SJMainState extends State<SJMain> {
  Future getData() async {
    try {
      var url = 'http://192.168.0.152/read.php';
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
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    List list = snapshot.data;
                    return ListTile(
                      leading: GestureDetector(
                        child: Icon(Icons.edit),
                      ),
                      title: Text(list[index]['ID']),
                      subtitle: Text(list[index]['PHONE']),
                      trailing: GestureDetector(
                        child: Icon(Icons.delete),
                        onTap: () {
                          setState(() {
                            var url = 'http://192.168.0.152/delete.php';
                            http.post(url, body: {
                              'id': list[index]['ID'],
                            });
                          });
                          debugPrint('delete Clicked');
                        },
                      ),
                    );
                  })
              : CircularProgressIndicator();
        },
      ),
    );
  }
}
