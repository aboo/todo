import 'package:todo/domain/tag.dart';

abstract class TagRepository {
  Future<List<Tag>> getAllTags();

  Future<void> addTag(Tag tag);
}
