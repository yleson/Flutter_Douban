import 'package:flutter/material.dart';

class GroupIndexPage extends StatelessWidget {
  const GroupIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('分组')),
      body: GroupIndexContent(),
    );
  }
}

class GroupIndexContent extends StatefulWidget {
  const GroupIndexContent({Key? key}) : super(key: key);

  @override
  _GroupIndexContentState createState() => _GroupIndexContentState();
}

class _GroupIndexContentState extends State<GroupIndexContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('分组内容'),
    );
  }
}
