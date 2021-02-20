part of 'articles_list_cubit.dart';

@immutable
abstract class ArticlesListState {}

class ArticlesListInitial extends ArticlesListState {}

class ArticlesListSuccess extends ArticlesListState {
  final List<Article> articles;

  ArticlesListSuccess(this.articles);
}
