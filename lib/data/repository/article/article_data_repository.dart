import 'package:nytimes/data/api/api_util.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/domain/repository/article/article_repository.dart';

class ArticleDataRepository extends ArticleRepository {
  final ApiUtil _apiUtil;

  ArticleDataRepository(this._apiUtil);

  @override
  Future<List<Article>> fetchArticles() {
    return _apiUtil.fetchArticles();
  }
}
