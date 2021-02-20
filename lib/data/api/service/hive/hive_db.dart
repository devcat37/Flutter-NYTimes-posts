import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:nytimes/data/api/request/article/cache_article_body.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDb {
  static const _ARTICLES = 'articles';
  static Future<void> init() async {
    var _dir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(_dir.path);

    await Hive.openBox(_ARTICLES);
  }

  Future<void> clearArticles() async {
    await Hive.box(_ARTICLES).clear();
  }

  Future<List<ApiArticle>> fetchArticles() async {
    // ignore: omit_local_variable_types
    List<ApiArticle> _apiList = [];

    for (var i = 0; i < Hive.box(_ARTICLES).length; i++) {
      _apiList
          .add(ApiArticle.fromApi(jsonDecode(Hive.box(_ARTICLES).getAt(i))));
    }
    return _apiList;
  }

  Future<void> cacheArticle(CacheArticleBody body) async {
    // ignore: unawaited_futures
    Hive.box(_ARTICLES).add(
      jsonEncode(body.toApi()),
    );
    print(jsonEncode(body.toApi()));
  }
}
