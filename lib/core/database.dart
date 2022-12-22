import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../data/models/quote.dart';

class DBProvider {
  static final DBProvider _db = DBProvider._internal();
  DBProvider._internal();
  static DBProvider get instance => _db;
  static Isar? _database;

  Future<Isar> get database async => _database ??= await initDB();

  initDB() async {
    final dir = await getApplicationSupportDirectory();
    return await Isar.open(
      [QuoteSchema],
      directory: dir.path,
      inspector: true,
    );
  }
}
