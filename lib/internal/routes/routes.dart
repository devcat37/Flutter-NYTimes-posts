import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final Sailor sailor = Sailor();

  static void createRoutes() {
    sailor.addRoutes(
      [
        SailorRoute(
          name: '/',
          builder: (context, args, params) {
            return Scaffold(
              backgroundColor: Colors.red,
            );
          },
        )
      ],
    );
  }
}
