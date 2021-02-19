import 'package:flutter/material.dart';
import 'package:nytimes/domain/model/article/article.dart';
import 'package:nytimes/presentation/widgets/articles_list/article_image.dart';

class ArticleContainer extends StatelessWidget {
  final Article article;
  final Orientation orientation;

  const ArticleContainer({Key key, this.article, this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (article == null) {
      return Container(
        height: 250.0,
        width: MediaQuery.of(context).size.width,
        color: Colors.black.withOpacity(0.02),
      );
    }
    return Container(
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
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    article.abstract,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  if (orientation == Orientation.landscape)
                    Column(
                      children: [
                        SizedBox(height: 24.0),
                        Text(article.url),
                      ],
                    ),
                  if (orientation == Orientation.portrait)
                    ArticleImage(
                      url: article.multimedia.first.url,
                    ),
                ],
              ),
            ),
          ),
          if (orientation == Orientation.landscape) SizedBox(width: 16.0),
          Expanded(
            flex: orientation == Orientation.landscape ? 1 : 0,
            child: Container(
              child: Column(
                children: [
                  ArticleImage(
                    url: article.multimedia.first.url,
                  ),
                  if (orientation == Orientation.landscape)
                    Text(article.multimedia.first.copyright),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
