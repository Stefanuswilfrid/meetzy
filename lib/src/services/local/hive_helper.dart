import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter('cache');

  /// [TODO]
  /// Open Hive Box
  await Hive.openBox<String>('userBox');
  await Hive.openBox<String>('bookmarkEventsBox');
}

Future<void> hiveClose() async {
  await Hive.close();
}
