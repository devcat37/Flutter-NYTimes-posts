import 'package:flutter/material.dart';
import 'package:nytimes/internal/routes/routes.dart';
import 'package:nytimes/internal/size/sizing.dart';
import 'package:nytimes/internal/theme/theming.dart';
import 'package:nytimes/presentation/global/splah_screen/splash_screen_view.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return LayoutBuilder(
          builder: (context, constraints) {
            Sizing().init(constraints, orientation);
            return MaterialApp(
              title: 'NYTimes Posts',
              navigatorKey: Routes.sailor.navigatorKey,
              onGenerateRoute: Routes.sailor.generator(),
              theme: Theming.currentTheme,
              home: SplashScreenView(),
            );
          },
        );
      },
    );
  }
}
