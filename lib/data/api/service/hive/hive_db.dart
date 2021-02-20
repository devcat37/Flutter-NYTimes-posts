import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:nytimes/data/api/model/article/api_article.dart';
import 'package:nytimes/data/api/request/article/cache_article_body.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDb {
  static const _ARTICLES = 'articles';

  /// Initialization of Hive Database,
  /// it is needed for further use.
  static Future<void> init() async {
    var _dir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(_dir.path);

    /// Openning box in [init()] method serves for faster usage of
    /// hive boxes during working flow of the program
    await Hive.openBox(_ARTICLES);
  }

  /// Clearing local storage in case of storage overflow
  /// In the program is used to clear storage and to place new data
  Future<void> clearArticles() async {
    await Hive.box(_ARTICLES).clear();
  }

  /// Fetching articles from the local storage
  Future<List<ApiArticle>> fetchArticles() async {
    /// Pedantic recommends to use [var] instead of [List<ApiArticle>]
    /// but it throws an exception due to a strict requirement
    /// in the return value [List<ApiArticle>]
    // ignore: omit_local_variable_types
    List<ApiArticle> _apiList = [];

    for (var i = 0; i < Hive.box(_ARTICLES).length; i++) {
      /// The code [utf8.decode(utf8.encode(Hive.box(_ARTICLES).getAt(i)))]
      /// should also be because of replacement with strange symbols
      _apiList.add(ApiArticle.fromApi(
          jsonDecode(utf8.decode(utf8.encode(Hive.box(_ARTICLES).getAt(i))))));
    }
    return _apiList;
  }

  /// Caching [Article]'s to the local storage for comfortable use of the data
  Future<void> cacheArticle(CacheArticleBody body) async {
    // ignore: unawaited_futures
    Hive.box(_ARTICLES).add(
      jsonEncode(body.toApi()),
    );
    // print(jsonEncode(body.toApi()));
  }
}
