import 'package:flutter/material.dart';

class MineIndexPage extends StatelessWidget {
  const MineIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: MineIndexContent(),
    );
  }
}

class MineIndexContent extends StatefulWidget {
  const MineIndexContent({Key? key}) : super(key: key);

  @override
  _MineIndexContentState createState() => _MineIndexContentState();
}

class _MineIndexContentState extends State<MineIndexContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('我的内容'),
    );
  }
}
