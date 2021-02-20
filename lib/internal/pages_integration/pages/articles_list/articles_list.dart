import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/internal/pages_integration/blocs/articles_list/cubit/articles_list_cubit.dart';
import 'package:nytimes/presentation/pages/articles_list/articles_list_view.dart';

class ArticlesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ArticlesListCubit(),
      child: BlocBuilder<ArticlesListCubit, ArticlesListState>(
        builder: (context, state) {
          return ArticlesListView();
        },
      ),
    );
  }
}
