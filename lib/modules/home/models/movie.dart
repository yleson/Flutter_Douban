// ignore_for_file: public_member_api_docs, sort_constructors_first
/**
 * 电影模型
 */
class MovieModel {
  late int rank;
  late String id;
  late String title;
  late String originalTitle;
  late String coverUrl;
  late double rate;
  late String genres;
  late List<ActorModel> actors;

  MovieModel.fromMap(Map<String, dynamic> json) {
    this.rank = json['rank'];
    final item = json['subject'];
    this.id = item['id'];
    this.title = item['title'];
    this.originalTitle = item['original_title'];
    this.coverUrl = (item['images'] as Map<String, dynamic>).values.first;
    this.rate = item['rating']['average'];
    this.genres = (item['genres'] as List<dynamic>).join(' / ');
    this.actors = (item['casts'] as List<dynamic>).map((e) {
      return ActorModel.fromMap(e);
    }).toList();
    // 无法指定具体类型，运行时会报错，暂时未知
    // this.coverUrl = (item['images'] as Map<String, String>).values.first;
    // this.genres = (item['genres'] as List<String>).join('/');
  }

  @override
  String toString() {
    return 'MovieModel(rank: $rank, id: $id, title: $title, originalTitle: $originalTitle, coverUrl: $coverUrl, rate: $rate, genres: $genres)';
  }
}

/**
 * 演员模型
 */
class ActorModel {
  late String name;

  ActorModel.fromMap(Map<String, dynamic> json) {
    this.name = json['name'];
  }
}
