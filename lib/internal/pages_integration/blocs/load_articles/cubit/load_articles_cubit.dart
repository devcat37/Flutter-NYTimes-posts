import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/data/api/api_util.dart';
import 'package:nytimes/data/repository/article/article_data_repository.dart';
import 'package:nytimes/domain/exception/load_articles_exception/load_articles_exception.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/domain/repository/article/article_repository.dart';

part 'load_articles_state.dart';

class LoadArticlesCubit extends Cubit<LoadArticlesState> {
  final ArticleRepository _articleRepository = ArticleDataRepository(ApiUtil());

  LoadArticlesCubit() : super(LoadArticlesInitial());

  Future<void> fetchArticles() async {
    return Future.delayed(
      Duration(milliseconds: 2500),
      () async {
        var _f = DateTime.now();
        emit(LoadArticlesLoading());

        try {
          var _list = await _articleRepository.fetchArticles();
          print(_list.first.title);

          emit(LoadArticlesSuccess(_list));
        } on SocketException {
          emit(LoadArticlesError('Unable to connect to the Internet!'));
        } on LoadArticlesException catch (e) {
          emit(LoadArticlesError(e.faultString));
        }

        print(
            'Request took ${DateTime.now().millisecondsSinceEpoch - _f.millisecondsSinceEpoch} ms!');
      },
    );
  }
}
