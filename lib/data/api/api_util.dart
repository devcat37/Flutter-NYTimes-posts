import 'package:nytimes/data/api/service/new_york_times/new_york_times.dart';
import 'package:nytimes/data/mapper/article/article_mapper.dart';
import 'package:nytimes/domain/model/article/article.dart';

class ApiUtil {
  Future<List<Article>> fetchArticles() async {
    var _articles = await NewYorkTimes().fetchArticles();
    // ignore: omit_local_variable_types
    List<Article> _list = [];
    for (var _article in _articles) {
      _list.add(ArticleMapper.fromApi(_article));
    }
    return _list;
  }
}
