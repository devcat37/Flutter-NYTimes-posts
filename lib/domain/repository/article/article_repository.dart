import 'package:nytimes/domain/model/article/article.dart';

abstract class ArticleRepository {
  Future<List<Article>> fetchArticles();

  Future<List<Article>> fetchCachedArticles();

  Future<void> cacheArticles({List<Article> articles});

  Future<void> clearArticles();
}
