import 'package:flutter/material.dart';
import 'package:nytimes/internal/size/sizing.dart';

class ArticleImage extends StatelessWidget {
  final String url;

  const ArticleImage({Key key, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 37.5 * Sizing.heightMultiplayer,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(url),
        ),
      ),
    );
  }
}
