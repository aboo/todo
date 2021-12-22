import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:todo/data/db/database.dart';
import 'package:todo/data/db/database_exceptions.dart';

class DatabaseImpl extends DataBase {
  late Database _db;

  @override
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    // making sure the directory exists
    await dir.create(recursive: true);
    final dbPath = '${dir.path}/database.db';
    DatabaseFactory dbFactory = databaseFactoryIo;
    _db = await dbFactory.openDatabase(dbPath);
  }

  @override
  Future<List<Map<String, dynamic>>> readAll(String collectionName) async {
    try {
      final store = stringMapStoreFactory.store(collectionName);
      final List<RecordSnapshot<String, Map<String, dynamic>>> snapshots =
          await store.find(_db);
      final List<Map<String, dynamic>> recordsList = [];
      snapshots.forEach(
        (snapshot) {
          recordsList.add(snapshot.value);
        },
      );
      return recordsList;
    } catch (e) {
      throw UnableToRead();
    }
  }

  @override
  Future<Map<String, dynamic>?> read(String collectionName, String key) {
    try {
      final store = stringMapStoreFactory.store(collectionName);
      return store.record(key).get(_db);
    } catch (e) {
      throw UnableToRead();
    }
  }

  @override
  Future<void> create(
      String collectionName, String key, Map<String, dynamic> value) async {
    try {
      final store = stringMapStoreFactory.store(collectionName);
      await store.record(key).put(_db, value);
    } catch (e) {
      throw UnableToCreate();
    }
  }

  @override
  Future<void> delete(String collectionName, String key) async {
    try {
      final store = stringMapStoreFactory.store(collectionName);
      await store.record(key).delete(_db);
    } catch (e) {
      throw UnableToDelete();
    }
  }

  @override
  Future<void> update(
      String collectionName, String key, Map<String, dynamic> value) async {
    try {
      final store = stringMapStoreFactory.store(collectionName);
      if (await store.record(key).exists(_db)) {
        await store.record(key).update(_db, value);
      } else {
        await store.record(key).put(_db, value);
      }
    } catch (e) {
      throw UnableToUpdate();
    }
  }
}
