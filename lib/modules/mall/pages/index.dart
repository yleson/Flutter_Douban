import 'package:flutter/material.dart';

class MallIndexPage extends StatelessWidget {
  const MallIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('商城')),
      body: MallIndexContent(),
    );
  }
}

class MallIndexContent extends StatefulWidget {
  const MallIndexContent({Key? key}) : super(key: key);

  @override
  _MallIndexContentState createState() => _MallIndexContentState();
}

class _MallIndexContentState extends State<MallIndexContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('商城内容'),
    );
  }
}
