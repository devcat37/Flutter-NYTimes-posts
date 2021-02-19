import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/internal/pages_integration/blocs/load_articles/cubit/load_articles_cubit.dart';
import 'package:nytimes/presentation/widgets/articles_list/article_container.dart';

class ArticlesListView extends StatelessWidget {
  static const _LOADING_LIST_COUNT = 5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadArticlesCubit, LoadArticlesState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  // ignore: omit_local_variable_types
                  Article _article = state is LoadArticlesSuccess
                      ? state.articles.elementAt(index)
                      : null;
                  return ArticleContainer(article: _article);
                },
                separatorBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: 10.0),
                      Container(
                        height: 1.0,
                        margin: EdgeInsets.symmetric(horizontal: 8.0),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      SizedBox(height: 10.0),
                    ],
                  );
                },
                itemCount: state is LoadArticlesSuccess
                    ? state.articles.length
                    : _LOADING_LIST_COUNT,
              ),
            ),
          ),
        );
      },
    );
  }
}
