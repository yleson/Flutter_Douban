import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/home/models/movie.dart';
import 'package:flutter_application_1/modules/home/widgets/index_list_item.dart';
import '../service/network.dart';
import '../widgets/index_list_item.dart';

class HomeIndexPage extends StatelessWidget {
  const HomeIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('口碑电影榜')),
      body: HomeIndexContent(),
    );
  }
}

class HomeIndexContent extends StatefulWidget {
  const HomeIndexContent({Key? key}) : super(key: key);

  @override
  _HomeIndexContentState createState() => _HomeIndexContentState();
}

class _HomeIndexContentState extends State<HomeIndexContent> {
  List<MovieModel> movies = [];

  @override
  void initState() {
    super.initState();

    HomeNetwork.movies().then((value) {
      setState(() {
        movies = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.only(bottom: 12),
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return HomeIndexListItemWidget(movie: movies[index]);
      },
    );
  }
}
