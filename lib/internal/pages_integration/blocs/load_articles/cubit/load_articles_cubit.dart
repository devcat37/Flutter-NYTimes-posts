import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'load_articles_state.dart';

class LoadArticlesCubit extends Cubit<LoadArticlesState> {
  LoadArticlesCubit() : super(LoadArticlesInitial());

  Future<void> fetchArticles() async {
    return Future.delayed(
      Duration(milliseconds: 2500),
      () {
        emit(LoadArticlesLoading());
      },
    );
  }
}
