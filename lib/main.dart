import 'package:flutter/material.dart';

import 'modules/main/pages/index.dart';

void main() {
  runApp(const MyApp());
}

class Point {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Color.fromRGBO(245, 246, 247, 1),
      ),
      home: MainIndexPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MainIndexPage();
  }
}
