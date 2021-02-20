import 'package:flutter/material.dart';
import 'package:nytimes/data/api/service/hive/hive_db.dart';
import 'package:nytimes/internal/application.dart';
import 'package:nytimes/internal/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HiveDb.init();
  Routes.createRoutes();

  runApp(Application());
}
