import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDb {
  static Future<void> init() async {
    var _dir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(_dir.path);
  }
}
