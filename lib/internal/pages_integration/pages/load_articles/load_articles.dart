import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/internal/pages_integration/blocs/load_articles/cubit/load_articles_cubit.dart';
import 'package:nytimes/internal/pages_integration/pages/articles_list/articles_list.dart';
import 'package:nytimes/presentation/global/splah_screen/splash_screen_view.dart';

class LoadArticles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadArticlesCubit()..fetchArticles(),
      child: BlocBuilder<LoadArticlesCubit, LoadArticlesState>(
        builder: (context, state) {
          if (state is! LoadArticlesInitial && state is! LoadArticlesError) {
            return ArticlesList();
          }
          return SplashScreenView();
        },
      ),
    );
  }
}
