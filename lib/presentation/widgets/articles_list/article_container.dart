import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/internal/pages_integration/blocs/articles_list/cubit/articles_list_cubit.dart';
import 'package:nytimes/internal/size/sizing.dart';
import 'package:nytimes/presentation/widgets/articles_list/article_image.dart';
import 'package:shimmer/shimmer.dart';

class ArticleContainer extends StatelessWidget {
  final Article article;
  final Orientation orientation;

  const ArticleContainer({Key key, this.article, this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return Shimmer.fromColors(
        child: Container(
          height: 22.5 * Sizing.heightMultiplayer,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          // color: Colors.black.withOpacity(0.02),
        ),
        baseColor: Colors.blueGrey[50],
        highlightColor: Colors.grey[400],
      );
    }
    return BlocBuilder<ArticlesListCubit, ArticlesListState>(
        builder: (context, state) {
      return InkWell(
        onTap: () =>
            BlocProvider.of<ArticlesListCubit>(context).launchUrl(article.url),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  // height: 250.0,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 4.3 * Sizing.widthMultiplayer,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 1.8 * Sizing.heightMultiplayer),
                      Text(
                        article.abstract,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 3.2 * Sizing.widthMultiplayer,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      if (orientation == Orientation.landscape)
                        Column(
                          children: [
                            SizedBox(height: 3.6 * Sizing.heightMultiplayer),
                            Text(
                              article.url,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      SizedBox(height: Sizing.heightMultiplayer * 2.0),
                      if (orientation == Orientation.portrait)
                        ArticleImage(
                          url: article.multimedia.first.url,
                        ),
                    ],
                  ),
                ),
              ),
              if (orientation == Orientation.landscape)
                SizedBox(width: 4.25 * Sizing.widthMultiplayer),
              Expanded(
                flex: orientation == Orientation.landscape ? 1 : 0,
                child: Container(
                  child: Column(
                    children: [
                      ArticleImage(
                        url: article.multimedia.first.url,
                      ),
                      if (orientation == Orientation.landscape)
                        Text(
                          article.multimedia.first.copyright,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
