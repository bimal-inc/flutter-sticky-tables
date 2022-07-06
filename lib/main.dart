import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'dart:io';

import 'package:logicseedtest/data/user.dart';

import 'package:logicseedtest/simple_table.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: "Logic Seed Test",
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final User _user = User();
  @override
  void initState() {
    _user.initData(100);
    super.initState();
  }

  // bool get isDesktop =>
  //     Platform.isLinux || Platform.isMacOS || Platform.isWindows;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            _getRouteButton(
              'Table Sample',
              SimpleTablePage(
                user: _user,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getRouteButton(String label, Widget page) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return page;
              },
            ),
          );
        },
        child: Text(
          label,
        ),
      ),
    );
  }
}
