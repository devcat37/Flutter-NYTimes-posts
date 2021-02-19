import 'package:flutter/material.dart';
import 'package:nytimes/internal/routes/routes.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYTimes Posts',
      navigatorKey: Routes.sailor.navigatorKey,
      onGenerateRoute: Routes.sailor.generator(),
      theme: ThemeData(),
      home: Scaffold(),
    );
  }
}
