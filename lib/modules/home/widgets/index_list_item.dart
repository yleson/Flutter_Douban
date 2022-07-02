// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/modules/home/models/movie.dart';
import 'package:flutter_application_1/common/widgets/rate.dart';

class HomeIndexListItemWidget extends StatelessWidget {
  final MovieModel movie;

  const HomeIndexListItemWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCoverWidget(),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: buildContentWidget(),
            ),
          ],
        ),
      ),
    );
  }

  // 封面
  Widget buildCoverWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(movie.coverUrl, width: 88),
    );
  }

  // 内容
  Widget buildContentWidget() {
    List<Widget> widgets = [];
    if (movie.rank <= 3) {
      widgets.add(Padding(
        padding: EdgeInsets.only(right: 6),
        child: Image.asset(
          'lib/assets/movie/movie_item_rank_${movie.rank}.png',
          height: 18,
        ),
      ));
    }
    widgets.add(Expanded(
      child: Text(
        movie.title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            overflow: TextOverflow.ellipsis),
      ),
    ));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: widgets,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          movie.originalTitle,
          style: TextStyle(color: Colors.black87, fontSize: 14),
        ),
        SizedBox(
          height: 6,
        ),
        Row(
          children: [
            RateWidget(
              currentRate: movie.rate,
              itemSize: 20,
              selectedColor: Color.fromARGB(255, 247, 197, 62),
            ),
            Text(
              ' (${movie.rate})',
              style: TextStyle(color: Colors.black45, fontSize: 14),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          '分类: ${movie.genres}',
          style: TextStyle(color: Colors.black38, fontSize: 14),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          '主演: ${movie.actors.map((e) => e.name).toList().join(' / ')}',
          style: TextStyle(
              color: Colors.black38,
              fontSize: 14,
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }
}
