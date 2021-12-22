import 'package:todo/data/db/database.dart';
import 'package:todo/data/tag/tag_repository.dart';
import 'package:todo/domain/tag.dart';

class TagRepositoryImpl implements TagRepository {
  const TagRepositoryImpl({required this.db});

  static const String tagsCollection = 'tags_collection';

  final DataBase db;

  @override
  Future<List<Tag>> getAllTags() async {
    try {
      List<Map<String, dynamic>> tagsJson = await db.readAll(tagsCollection);
      return tagsJson.map((json) => Tag.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> addTag(Tag tag) async {
    try {
      await db.create(tagsCollection, tag.name, tag.toJson());
    } catch (e) {
      rethrow;
    }
  }
}
