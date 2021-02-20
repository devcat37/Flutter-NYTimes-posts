import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/internal/pages_integration/blocs/load_articles/cubit/load_articles_cubit.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticlesListErrorView extends StatelessWidget {
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadArticlesCubit, LoadArticlesState>(
      builder: (context, state) {
        return Scaffold(
          body: SmartRefresher(
            controller: _refreshController,
            onRefresh: () =>
                BlocProvider.of<LoadArticlesCubit>(context).fetchArticles(),
            child: Center(
              child: Text(
                (state is LoadArticlesError
                        ? (state.message.isEmpty
                            ? 'Error while loading articles.'
                            : state.message)
                        : ('')) +
                    '\nPlease, pull to retry request!',
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
