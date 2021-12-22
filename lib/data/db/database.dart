abstract class DataBase {
  Future<void> init();

  Future<List<Map<String, dynamic>>> readAll(String collectionName);

  Future<Map<String, dynamic>?> read(String collectionName, String key);

  Future<void> create(
    String collectionName,
    String key,
    Map<String, dynamic> value,
  );

  Future<void> update(
    String collectionName,
    String key,
    Map<String, dynamic> value,
  );

  Future<void> delete(String collectionName, String key);
}
