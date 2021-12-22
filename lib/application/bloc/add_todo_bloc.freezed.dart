// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AddTodoEventTearOff {
  const _$AddTodoEventTearOff();

  AddTodoTagAdded tagAdded(String tag) {
    return AddTodoTagAdded(
      tag,
    );
  }

  AddTodoSaveButtonPressed saveButtonPressed() {
    return const AddTodoSaveButtonPressed();
  }
}

/// @nodoc
const $AddTodoEvent = _$AddTodoEventTearOff();

/// @nodoc
mixin _$AddTodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tag) tagAdded,
    required TResult Function() saveButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddTodoTagAdded value) tagAdded,
    required TResult Function(AddTodoSaveButtonPressed value) saveButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoEventCopyWith<$Res> {
  factory $AddTodoEventCopyWith(
          AddTodoEvent value, $Res Function(AddTodoEvent) then) =
      _$AddTodoEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddTodoEventCopyWithImpl<$Res> implements $AddTodoEventCopyWith<$Res> {
  _$AddTodoEventCopyWithImpl(this._value, this._then);

  final AddTodoEvent _value;
  // ignore: unused_field
  final $Res Function(AddTodoEvent) _then;
}

/// @nodoc
abstract class $AddTodoTagAddedCopyWith<$Res> {
  factory $AddTodoTagAddedCopyWith(
          AddTodoTagAdded value, $Res Function(AddTodoTagAdded) then) =
      _$AddTodoTagAddedCopyWithImpl<$Res>;
  $Res call({String tag});
}

/// @nodoc
class _$AddTodoTagAddedCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res>
    implements $AddTodoTagAddedCopyWith<$Res> {
  _$AddTodoTagAddedCopyWithImpl(
      AddTodoTagAdded _value, $Res Function(AddTodoTagAdded) _then)
      : super(_value, (v) => _then(v as AddTodoTagAdded));

  @override
  AddTodoTagAdded get _value => super._value as AddTodoTagAdded;

  @override
  $Res call({
    Object? tag = freezed,
  }) {
    return _then(AddTodoTagAdded(
      tag == freezed
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddTodoTagAdded implements AddTodoTagAdded {
  const _$AddTodoTagAdded(this.tag);

  @override
  final String tag;

  @override
  String toString() {
    return 'AddTodoEvent.tagAdded(tag: $tag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTodoTagAdded &&
            const DeepCollectionEquality().equals(other.tag, tag));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(tag));

  @JsonKey(ignore: true)
  @override
  $AddTodoTagAddedCopyWith<AddTodoTagAdded> get copyWith =>
      _$AddTodoTagAddedCopyWithImpl<AddTodoTagAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tag) tagAdded,
    required TResult Function() saveButtonPressed,
  }) {
    return tagAdded(tag);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
  }) {
    return tagAdded?.call(tag);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
    required TResult orElse(),
  }) {
    if (tagAdded != null) {
      return tagAdded(tag);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddTodoTagAdded value) tagAdded,
    required TResult Function(AddTodoSaveButtonPressed value) saveButtonPressed,
  }) {
    return tagAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
  }) {
    return tagAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
    required TResult orElse(),
  }) {
    if (tagAdded != null) {
      return tagAdded(this);
    }
    return orElse();
  }
}

abstract class AddTodoTagAdded implements AddTodoEvent {
  const factory AddTodoTagAdded(String tag) = _$AddTodoTagAdded;

  String get tag;
  @JsonKey(ignore: true)
  $AddTodoTagAddedCopyWith<AddTodoTagAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoSaveButtonPressedCopyWith<$Res> {
  factory $AddTodoSaveButtonPressedCopyWith(AddTodoSaveButtonPressed value,
          $Res Function(AddTodoSaveButtonPressed) then) =
      _$AddTodoSaveButtonPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AddTodoSaveButtonPressedCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res>
    implements $AddTodoSaveButtonPressedCopyWith<$Res> {
  _$AddTodoSaveButtonPressedCopyWithImpl(AddTodoSaveButtonPressed _value,
      $Res Function(AddTodoSaveButtonPressed) _then)
      : super(_value, (v) => _then(v as AddTodoSaveButtonPressed));

  @override
  AddTodoSaveButtonPressed get _value =>
      super._value as AddTodoSaveButtonPressed;
}

/// @nodoc

class _$AddTodoSaveButtonPressed implements AddTodoSaveButtonPressed {
  const _$AddTodoSaveButtonPressed();

  @override
  String toString() {
    return 'AddTodoEvent.saveButtonPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddTodoSaveButtonPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String tag) tagAdded,
    required TResult Function() saveButtonPressed,
  }) {
    return saveButtonPressed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
  }) {
    return saveButtonPressed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String tag)? tagAdded,
    TResult Function()? saveButtonPressed,
    required TResult orElse(),
  }) {
    if (saveButtonPressed != null) {
      return saveButtonPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddTodoTagAdded value) tagAdded,
    required TResult Function(AddTodoSaveButtonPressed value) saveButtonPressed,
  }) {
    return saveButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
  }) {
    return saveButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddTodoTagAdded value)? tagAdded,
    TResult Function(AddTodoSaveButtonPressed value)? saveButtonPressed,
    required TResult orElse(),
  }) {
    if (saveButtonPressed != null) {
      return saveButtonPressed(this);
    }
    return orElse();
  }
}

abstract class AddTodoSaveButtonPressed implements AddTodoEvent {
  const factory AddTodoSaveButtonPressed() = _$AddTodoSaveButtonPressed;
}

/// @nodoc
class _$AddTodoStateTearOff {
  const _$AddTodoStateTearOff();

  _AddTodoState call(
      {required TextEditingController titleController,
      required TextEditingController descriptionController,
      required List<Tag> tags,
      required bool shouldNavigateToHomePage}) {
    return _AddTodoState(
      titleController: titleController,
      descriptionController: descriptionController,
      tags: tags,
      shouldNavigateToHomePage: shouldNavigateToHomePage,
    );
  }
}

/// @nodoc
const $AddTodoState = _$AddTodoStateTearOff();

/// @nodoc
mixin _$AddTodoState {
  TextEditingController get titleController =>
      throw _privateConstructorUsedError;
  TextEditingController get descriptionController =>
      throw _privateConstructorUsedError;
  List<Tag> get tags => throw _privateConstructorUsedError;
  bool get shouldNavigateToHomePage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
          AddTodoState value, $Res Function(AddTodoState) then) =
      _$AddTodoStateCopyWithImpl<$Res>;
  $Res call(
      {TextEditingController titleController,
      TextEditingController descriptionController,
      List<Tag> tags,
      bool shouldNavigateToHomePage});
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res> implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  final AddTodoState _value;
  // ignore: unused_field
  final $Res Function(AddTodoState) _then;

  @override
  $Res call({
    Object? titleController = freezed,
    Object? descriptionController = freezed,
    Object? tags = freezed,
    Object? shouldNavigateToHomePage = freezed,
  }) {
    return _then(_value.copyWith(
      titleController: titleController == freezed
          ? _value.titleController
          : titleController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      descriptionController: descriptionController == freezed
          ? _value.descriptionController
          : descriptionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      shouldNavigateToHomePage: shouldNavigateToHomePage == freezed
          ? _value.shouldNavigateToHomePage
          : shouldNavigateToHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$AddTodoStateCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$AddTodoStateCopyWith(
          _AddTodoState value, $Res Function(_AddTodoState) then) =
      __$AddTodoStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {TextEditingController titleController,
      TextEditingController descriptionController,
      List<Tag> tags,
      bool shouldNavigateToHomePage});
}

/// @nodoc
class __$AddTodoStateCopyWithImpl<$Res> extends _$AddTodoStateCopyWithImpl<$Res>
    implements _$AddTodoStateCopyWith<$Res> {
  __$AddTodoStateCopyWithImpl(
      _AddTodoState _value, $Res Function(_AddTodoState) _then)
      : super(_value, (v) => _then(v as _AddTodoState));

  @override
  _AddTodoState get _value => super._value as _AddTodoState;

  @override
  $Res call({
    Object? titleController = freezed,
    Object? descriptionController = freezed,
    Object? tags = freezed,
    Object? shouldNavigateToHomePage = freezed,
  }) {
    return _then(_AddTodoState(
      titleController: titleController == freezed
          ? _value.titleController
          : titleController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      descriptionController: descriptionController == freezed
          ? _value.descriptionController
          : descriptionController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      shouldNavigateToHomePage: shouldNavigateToHomePage == freezed
          ? _value.shouldNavigateToHomePage
          : shouldNavigateToHomePage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddTodoState implements _AddTodoState {
  const _$_AddTodoState(
      {required this.titleController,
      required this.descriptionController,
      required this.tags,
      required this.shouldNavigateToHomePage});

  @override
  final TextEditingController titleController;
  @override
  final TextEditingController descriptionController;
  @override
  final List<Tag> tags;
  @override
  final bool shouldNavigateToHomePage;

  @override
  String toString() {
    return 'AddTodoState(titleController: $titleController, descriptionController: $descriptionController, tags: $tags, shouldNavigateToHomePage: $shouldNavigateToHomePage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTodoState &&
            const DeepCollectionEquality()
                .equals(other.titleController, titleController) &&
            const DeepCollectionEquality()
                .equals(other.descriptionController, descriptionController) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality().equals(
                other.shouldNavigateToHomePage, shouldNavigateToHomePage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(titleController),
      const DeepCollectionEquality().hash(descriptionController),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(shouldNavigateToHomePage));

  @JsonKey(ignore: true)
  @override
  _$AddTodoStateCopyWith<_AddTodoState> get copyWith =>
      __$AddTodoStateCopyWithImpl<_AddTodoState>(this, _$identity);
}

abstract class _AddTodoState implements AddTodoState {
  const factory _AddTodoState(
      {required TextEditingController titleController,
      required TextEditingController descriptionController,
      required List<Tag> tags,
      required bool shouldNavigateToHomePage}) = _$_AddTodoState;

  @override
  TextEditingController get titleController;
  @override
  TextEditingController get descriptionController;
  @override
  List<Tag> get tags;
  @override
  bool get shouldNavigateToHomePage;
  @override
  @JsonKey(ignore: true)
  _$AddTodoStateCopyWith<_AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}
