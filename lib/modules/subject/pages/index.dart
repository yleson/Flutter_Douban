import 'package:flutter/material.dart';

class SubjectIndexPage extends StatelessWidget {
  const SubjectIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('课程')),
      body: SubjectIndexContent(),
    );
  }
}

class SubjectIndexContent extends StatefulWidget {
  const SubjectIndexContent({Key? key}) : super(key: key);

  @override
  _SubjectIndexContentState createState() => _SubjectIndexContentState();
}

class _SubjectIndexContentState extends State<SubjectIndexContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('课程内容'),
    );
  }
}
