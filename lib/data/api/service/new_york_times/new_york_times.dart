import 'dart:convert';

import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes/domain/exception/load_articles_exception/load_articles_exception.dart';

class NewYorkTimes {
  Future<List<ApiArticle>> fetchArticles() async {
    // ignore: omit_local_variable_types
    List<ApiArticle> _list = [];
    var _response = await http.get(
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=DxCBZ06lqSIAVNsLf8zGfn8AQFYgMwaU');

    for (var i = 0; i < jsonDecode(_response.body)['results'].length; i++) {
      _list.add(ApiArticle.fromApi(jsonDecode(_response.body)['results'][i]));
    }

    if (_list.isEmpty) {
      throw LoadArticlesException('Articles list is empty');
    } else if (_response.statusCode != 200) {
      throw LoadArticlesException('Response code is not success');
    }

    return _list;
  }
}
