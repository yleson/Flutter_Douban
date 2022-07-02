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

class HomeIndexContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: HomeNetwork.movies(),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: RefreshProgressIndicator());
        }

        final movies = snapshot.data;
        if (movies == null) {
          return Center(
            child: Text(
              '暂无数据',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.only(bottom: 12),
          itemCount: movies.length,
          itemBuilder: (ctx, index) {
            return HomeIndexListItemWidget(movie: movies[index]);
          },
        );
      },
    );
  }
}
