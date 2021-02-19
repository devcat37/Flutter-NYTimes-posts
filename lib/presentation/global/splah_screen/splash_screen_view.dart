import 'package:flutter/material.dart';
import 'package:nytimes/internal/size/sizing.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  'New York' +
                      ((orientation == Orientation.portrait) ? ('\n') : (' ')) +
                      'Times',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Sizing.textMultiplayer * 12.0,
                    fontFamily: 'Chomsky',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      );
    });
  }
}
