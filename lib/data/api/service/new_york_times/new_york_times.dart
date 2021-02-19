import 'dart:convert';

import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:http/http.dart' as http;

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
      // TODO: response is empty exception
    }
    return _list;
  }
}
