import 'package:flutter/material.dart';

import '../../home/pages/index.dart';
import '../../mall/pages/index.dart';
import '../../group/pages/index.dart';
import '../../subject/pages/index.dart';
import '../../mine/pages/index.dart';

class MainIndexPage extends StatefulWidget {
  const MainIndexPage({Key? key}) : super(key: key);

  @override
  _MainIndexPageState createState() => _MainIndexPageState();
}

class _MainIndexPageState extends State<MainIndexPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HomeIndexPage(),
          MallIndexPage(),
          GroupIndexPage(),
          SubjectIndexPage(),
          MineIndexPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_filter_outlined), label: "电影"),
          BottomNavigationBarItem(icon: Icon(Icons.addchart), label: "商城"),
          BottomNavigationBarItem(icon: Icon(Icons.agriculture), label: "分组"),
          BottomNavigationBarItem(
              icon: Icon(Icons.date_range_outlined), label: "课程"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: "我的")
        ],
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
