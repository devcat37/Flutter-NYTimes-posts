import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nytimes/data/api/api_util.dart';
import 'package:nytimes/data/repository/article/article_data_repository.dart';
import 'package:nytimes/domain/repository/article/article_repository.dart';

part 'load_articles_state.dart';

class LoadArticlesCubit extends Cubit<LoadArticlesState> {
  final ArticleRepository _articleRepository = ArticleDataRepository(ApiUtil());

  LoadArticlesCubit() : super(LoadArticlesInitial());

  Future<void> fetchArticles() async {
    var _f = DateTime.now();
    return Future.delayed(
      Duration(milliseconds: 0),
      () async {
        emit(LoadArticlesLoading());

        try {
          var _list = await _articleRepository.fetchArticles();
          print(_list.last.title);
          emit(LoadArticlesSuccess());
        } on SocketException {
          emit(LoadArticlesError('Unable to connect to the Internet!'));
        }

        print(
            'Request took ${DateTime.now().millisecondsSinceEpoch - _f.millisecondsSinceEpoch} ms!');
      },
    );
  }
}
