// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ToDoDao? _todoDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ToDoEntity` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `userId` INTEGER NOT NULL, `title` TEXT NOT NULL, `orderIndex` INTEGER NOT NULL, `description` TEXT NOT NULL, `dateTime` TEXT NOT NULL, `status` INTEGER NOT NULL, `tagId` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ToDoDao get todoDao {
    return _todoDaoInstance ??= _$ToDoDao(database, changeListener);
  }
}

class _$ToDoDao extends ToDoDao {
  _$ToDoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _toDoEntityInsertionAdapter = InsertionAdapter(
            database,
            'ToDoEntity',
            (ToDoEntity item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'title': item.title,
                  'orderIndex': item.orderIndex,
                  'description': item.description,
                  'dateTime': item.dateTime,
                  'status': item.status,
                  'tagId': item.tagId
                }),
        _toDoEntityUpdateAdapter = UpdateAdapter(
            database,
            'ToDoEntity',
            ['id'],
            (ToDoEntity item) => <String, Object?>{
                  'id': item.id,
                  'userId': item.userId,
                  'title': item.title,
                  'orderIndex': item.orderIndex,
                  'description': item.description,
                  'dateTime': item.dateTime,
                  'status': item.status,
                  'tagId': item.tagId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ToDoEntity> _toDoEntityInsertionAdapter;

  final UpdateAdapter<ToDoEntity> _toDoEntityUpdateAdapter;

  @override
  Future<List<ToDoEntity>> findAll(int userId, int limit, int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ToDoEntity WHERE userId = ?1 ORDER BY id DESC LIMIT ?2 OFFSET ?3',
        mapper: (Map<String, Object?> row) => ToDoEntity(id: row['id'] as int?, orderIndex: row['orderIndex'] as int, userId: row['userId'] as int, status: row['status'] as int, title: row['title'] as String, description: row['description'] as String, dateTime: row['dateTime'] as String, tagId: row['tagId'] as String),
        arguments: [userId, limit, offset]);
  }

  @override
  Future<List<ToDoEntity>> filter(
      int tagId, int status, int userId, int limit, int offset) async {
    return _queryAdapter.queryList(
        'SELECT * FROM ToDoEntity WHERE userId = ?3 AND tagId = ?1 AND status = ?2 ORDER BY id DESC LIMIT ?4 OFFSET ?5',
        mapper: (Map<String, Object?> row) => ToDoEntity(id: row['id'] as int?, orderIndex: row['orderIndex'] as int, userId: row['userId'] as int, status: row['status'] as int, title: row['title'] as String, description: row['description'] as String, dateTime: row['dateTime'] as String, tagId: row['tagId'] as String),
        arguments: [tagId, status, userId, limit, offset]);
  }

  @override
  Future<ToDoEntity?> findToDoEntity(int id, int userId) async {
    return _queryAdapter.query(
        'SELECT * FROM ToDoEntity WHERE id = ?1 AND userId = ?2',
        mapper: (Map<String, Object?> row) => ToDoEntity(
            id: row['id'] as int?,
            orderIndex: row['orderIndex'] as int,
            userId: row['userId'] as int,
            status: row['status'] as int,
            title: row['title'] as String,
            description: row['description'] as String,
            dateTime: row['dateTime'] as String,
            tagId: row['tagId'] as String),
        arguments: [id, userId]);
  }

  @override
  Future<void> deleteAll(int userId) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM ToDoEntity WHERE userId = ?1',
        arguments: [userId]);
  }

  @override
  Future<void> delete(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM ToDoEntity WHERE id = ?1', arguments: [id]);
  }

  @override
  Future<int> insertToDoEntity(ToDoEntity toDoEntity) {
    return _toDoEntityInsertionAdapter.insertAndReturnId(
        toDoEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateToDoEntity(ToDoEntity toDoEntity) async {
    await _toDoEntityUpdateAdapter.update(
        toDoEntity, OnConflictStrategy.replace);
  }
}
