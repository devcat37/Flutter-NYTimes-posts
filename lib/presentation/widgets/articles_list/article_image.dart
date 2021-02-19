import 'package:flutter/material.dart';

class ArticleImage extends StatelessWidget {
  final String url;

  const ArticleImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
