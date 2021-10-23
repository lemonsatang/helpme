import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_helpme/AddEditPage.dart';
import 'dart:convert';
import 'dart:async';
import 'package:project_helpme/main.dart';

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
        title: Text("Second Route"),
      ),
      body: Center(
        child: Text('Go back!'),
      ),
    );
  }
}
