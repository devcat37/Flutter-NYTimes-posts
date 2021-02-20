import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/internal/pages_integration/blocs/articles_list/cubit/articles_list_cubit.dart';
import 'package:nytimes/presentation/widgets/articles_list/article_container.dart';

class ArticlesListView extends StatelessWidget {
  static const _LOADING_LIST_COUNT = 5;
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return BlocBuilder<ArticlesListCubit, ArticlesListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'The New York Times',
                style: TextStyle(fontFamily: 'Chomsky', color: Colors.black),
              ),
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0,
            ),
            body: SafeArea(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: ListView.separated(
                  controller: _controller,
                  itemBuilder: (context, index) {
                    // ignore: omit_local_variable_types
                    Article _article = state is ArticlesListSuccess
                        ? state.articles.elementAt(index)
                        : null;
                    return ArticleContainer(
                        article: _article, orientation: orientation);
                  },
                  separatorBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(height: 10.0),
                        Container(
                          height: 1.0,
                          // margin: EdgeInsets.symmetric(horizontal: 8.0),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black.withOpacity(0.5),
                        ),
                        SizedBox(height: 10.0),
                      ],
                    );
                  },
                  itemCount: state is ArticlesListSuccess
                      ? state.articles.length
                      : _LOADING_LIST_COUNT,
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
