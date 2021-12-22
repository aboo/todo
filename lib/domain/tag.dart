import 'package:freezed_annotation/freezed_annotation.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

// README: even though tag has only one property, making it a data class and
// giving it its own repository is a better approach than just treating it
// like a string.

@freezed
class Tag with _$Tag {
  const Tag._();

  const factory Tag({
    required String name,
  }) = _Tag;

  factory Tag.newInstance(String name) => Tag(
        name: name,
      );

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);
}
