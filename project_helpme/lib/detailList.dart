import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/main.dart';
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';

class detailList extends StatefulWidget {
  final List list;
  detailList({required this.list});

  @override
  _detailListState createState() => _detailListState();
}

class _detailListState extends State<detailList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Second Route"),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.save,
                    size: 16.0,
                    color: Colors.green[800],
                  ),
                  Text(
                    '수정내용 저장',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    size: 16.0,
                    color: Colors.green[800],
                  ),
                  Text(
                    '삭제',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
