import 'package:flutter_application_1/modules/home/models/movie.dart';
import 'package:flutter_application_1/network/http.dart';

class HomeNetwork {
  static Future<List<MovieModel>> movies() async {
    // 获取对应原始数据
    final result = await Http.request('/movie/weekly');
    final subjects = result['subjects'];

    // 解析模型
    List<MovieModel> movies = [];
    for (var item in subjects) {
      movies.add(MovieModel.fromMap(item));
    }
    // 直接return，会自动按需封装一层Future
    return movies;
  }
}
