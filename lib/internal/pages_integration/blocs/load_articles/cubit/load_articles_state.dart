part of 'load_articles_cubit.dart';

@immutable
abstract class LoadArticlesState {}

class LoadArticlesInitial extends LoadArticlesState {}

class LoadArticlesLoading extends LoadArticlesState {}

class LoadArticlesSuccess extends LoadArticlesState {
  final List<Article> articles;

  LoadArticlesSuccess(this.articles);
}

class LoadArticlesError extends LoadArticlesState {
  final String message;

  LoadArticlesError(this.message);
}
