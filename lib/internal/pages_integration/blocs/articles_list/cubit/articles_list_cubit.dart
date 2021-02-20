import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/data/api/api_util.dart';
import 'package:nytimes/data/repository/article/article_data_repository.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/domain/repository/article/article_repository.dart';
import 'package:url_launcher/url_launcher.dart';

part 'articles_list_state.dart';

class ArticlesListCubit extends Cubit<ArticlesListState> {
  final ArticleRepository _articleRepository = ArticleDataRepository(ApiUtil());

  ArticlesListCubit() : super(ArticlesListInitial());

  Future<void> fetchArticles() async {
    var articles = await _articleRepository.fetchCachedArticles();
    return Future.delayed(
      Duration(milliseconds: 1500),
      () {
        emit(ArticlesListSuccess(articles));
      },
    );
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
