import 'package:nytimes/data/api/request/article/cache_article_body.dart';
import 'package:nytimes/data/api/service/hive/hive_db.dart';
import 'package:nytimes/data/api/service/new_york_times/new_york_times.dart';
import 'package:nytimes/data/mapper/article/article_mapper.dart';
import 'package:nytimes/domain/model/article/article.dart';

/// Single spot for all the api's
class ApiUtil {
  /// Fetching [Article]'s from nytimes.com/
  Future<List<Article>> fetchArticles() async {
    var _articles = await NewYorkTimes().fetchArticles();

    /// Pedantic recommends to use [var] instead of [List<ApiArticle>]
    /// but it throws an exception due to a strict requirement
    /// in the return value [List<Article>]
    // ignore: omit_local_variable_types
    List<Article> _list = [];
    for (var _article in _articles) {
      _list.add(ArticleMapper.fromApi(_article));
    }
    return _list;
  }

  /// Fetching cached [Article]'s from HiveDb storage
  Future<List<Article>> fetchCachedArticles() async {
    var _articles = await HiveDb().fetchArticles();

    /// Pedantic recommends to use [var] instead of [List<ApiArticle>]
    /// but it throws an exception due to a strict requirement
    /// in the return value [List<Article>]
    // ignore: omit_local_variable_types
    List<Article> _list = [];
    for (var _article in _articles) {
      _list.add(ArticleMapper.fromApi(_article));
    }
    return _list;
  }

  /// Clearing [Article]'s from the local storage
  Future<void> clearArticles() async {
    return await HiveDb().clearArticles();
  }

  /// Saving(caching) [Article]'s to the local storage for further
  /// comfortable use
  Future<void> cacheArticles({List<Article> articles}) async {
    /// [_body] is declared before for-loop due to the memory efficiency
    var _body;
    for (var _article in articles) {
      _body = CacheArticleBody.fromModel(_article);
      // ignore: unawaited_futures
      HiveDb().cacheArticle(_body);
    }
  }
}
