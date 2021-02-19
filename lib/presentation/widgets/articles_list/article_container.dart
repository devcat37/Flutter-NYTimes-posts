import 'package:flutter/material.dart';
import 'package:nytimes/domain/model/article/article.dart';

class ArticleContainer extends StatelessWidget {
  final Article article;

  const ArticleContainer({Key key, this.article}) : super(key: key);

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
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      // color: Colors.black.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );
  }
}
