import 'dart:convert';

import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:http/http.dart' as http;
import 'package:nytimes/domain/exception/load_articles_exception/load_articles_exception.dart';

class NewYorkTimes {
  static const _API_KEY = 'DxCBZ06lqSIAVNsLf8zGfn8AQFYgMwaU';
  static const _TOP_STORIES_PART = 'home';

  Future<List<ApiArticle>> fetchArticles() async {
    /// Pedantic recommends to use [var] instead of [List<ApiArticle>]
    /// but it throws an exception due to a strict requirement
    /// in the return value [List<ApiArticle>]
    // ignore: omit_local_variable_types
    List<ApiArticle> _list = [];
    var _response = await http.get(
        'https://api.nytimes.com/svc/topstories/v2/${_TOP_STORIES_PART}.json?api-key=${_API_KEY}');

    for (var i = 0; i < jsonDecode(_response.body)['results'].length; i++) {
      /// utf8.decode(_response.bodyBytes)
      /// Without [utf8.decode(_response.bodyBytes)] request replaces '(apostrophe) with strange symbols
      /// e.g When Could the United States Reach Herd Immunity? Itâs Complicated.
      /// whilst it should be When Could the United States Reach Herd Immunity? It's Complicated.
      _list.add(ApiArticle.fromApi(
          jsonDecode(utf8.decode(_response.bodyBytes))['results'][i]));
    }

    if (_list.isEmpty) {
      throw LoadArticlesException('Articles list is empty');
    } else if (_response.statusCode != 200) {
      throw LoadArticlesException('Response code is not success');
    }
    return _list;
  }
}
