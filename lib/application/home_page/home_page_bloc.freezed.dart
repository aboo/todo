// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_page_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomePageEventTearOff {
  const _$HomePageEventTearOff();

  HomePageInitialized initialized() {
    return const HomePageInitialized();
  }

  HomePageCheckButtonPressed checkButtonPressed(Todo todo) {
    return HomePageCheckButtonPressed(
      todo,
    );
  }

  HomePageDeleteButtonPressed deleteButtonPressed(Todo todo) {
    return HomePageDeleteButtonPressed(
      todo,
    );
  }

  HomePageTodoReordered todoReorderd(int oldIndex, int newIndex) {
    return HomePageTodoReordered(
      oldIndex,
      newIndex,
    );
  }

  HomePageFiltersChanged filtersChanged(
      bool showRemainedTodos, List<Tag> selectedTags) {
    return HomePageFiltersChanged(
      showRemainedTodos,
      selectedTags,
    );
  }

  HomePageGotbackFromAddTodoPage gotBackFromAddTodoPage() {
    return const HomePageGotbackFromAddTodoPage();
  }
}

/// @nodoc
const $HomePageEvent = _$HomePageEventTearOff();

/// @nodoc
mixin _$HomePageEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEventCopyWith<$Res> {
  factory $HomePageEventCopyWith(
          HomePageEvent value, $Res Function(HomePageEvent) then) =
      _$HomePageEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageEventCopyWith<$Res> {
  _$HomePageEventCopyWithImpl(this._value, this._then);

  final HomePageEvent _value;
  // ignore: unused_field
  final $Res Function(HomePageEvent) _then;
}

/// @nodoc
abstract class $HomePageInitializedCopyWith<$Res> {
  factory $HomePageInitializedCopyWith(
          HomePageInitialized value, $Res Function(HomePageInitialized) then) =
      _$HomePageInitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageInitializedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageInitializedCopyWith<$Res> {
  _$HomePageInitializedCopyWithImpl(
      HomePageInitialized _value, $Res Function(HomePageInitialized) _then)
      : super(_value, (v) => _then(v as HomePageInitialized));

  @override
  HomePageInitialized get _value => super._value as HomePageInitialized;
}

/// @nodoc

class _$HomePageInitialized implements HomePageInitialized {
  const _$HomePageInitialized();

  @override
  String toString() {
    return 'HomePageEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageInitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class HomePageInitialized implements HomePageEvent {
  const factory HomePageInitialized() = _$HomePageInitialized;
}

/// @nodoc
abstract class $HomePageCheckButtonPressedCopyWith<$Res> {
  factory $HomePageCheckButtonPressedCopyWith(HomePageCheckButtonPressed value,
          $Res Function(HomePageCheckButtonPressed) then) =
      _$HomePageCheckButtonPressedCopyWithImpl<$Res>;
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class _$HomePageCheckButtonPressedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageCheckButtonPressedCopyWith<$Res> {
  _$HomePageCheckButtonPressedCopyWithImpl(HomePageCheckButtonPressed _value,
      $Res Function(HomePageCheckButtonPressed) _then)
      : super(_value, (v) => _then(v as HomePageCheckButtonPressed));

  @override
  HomePageCheckButtonPressed get _value =>
      super._value as HomePageCheckButtonPressed;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(HomePageCheckButtonPressed(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$HomePageCheckButtonPressed implements HomePageCheckButtonPressed {
  const _$HomePageCheckButtonPressed(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'HomePageEvent.checkButtonPressed(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageCheckButtonPressed &&
            const DeepCollectionEquality().equals(other.todo, todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todo));

  @JsonKey(ignore: true)
  @override
  $HomePageCheckButtonPressedCopyWith<HomePageCheckButtonPressed>
      get copyWith =>
          _$HomePageCheckButtonPressedCopyWithImpl<HomePageCheckButtonPressed>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return checkButtonPressed(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return checkButtonPressed?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (checkButtonPressed != null) {
      return checkButtonPressed(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return checkButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return checkButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (checkButtonPressed != null) {
      return checkButtonPressed(this);
    }
    return orElse();
  }
}

abstract class HomePageCheckButtonPressed implements HomePageEvent {
  const factory HomePageCheckButtonPressed(Todo todo) =
      _$HomePageCheckButtonPressed;

  Todo get todo;
  @JsonKey(ignore: true)
  $HomePageCheckButtonPressedCopyWith<HomePageCheckButtonPressed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageDeleteButtonPressedCopyWith<$Res> {
  factory $HomePageDeleteButtonPressedCopyWith(
          HomePageDeleteButtonPressed value,
          $Res Function(HomePageDeleteButtonPressed) then) =
      _$HomePageDeleteButtonPressedCopyWithImpl<$Res>;
  $Res call({Todo todo});

  $TodoCopyWith<$Res> get todo;
}

/// @nodoc
class _$HomePageDeleteButtonPressedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageDeleteButtonPressedCopyWith<$Res> {
  _$HomePageDeleteButtonPressedCopyWithImpl(HomePageDeleteButtonPressed _value,
      $Res Function(HomePageDeleteButtonPressed) _then)
      : super(_value, (v) => _then(v as HomePageDeleteButtonPressed));

  @override
  HomePageDeleteButtonPressed get _value =>
      super._value as HomePageDeleteButtonPressed;

  @override
  $Res call({
    Object? todo = freezed,
  }) {
    return _then(HomePageDeleteButtonPressed(
      todo == freezed
          ? _value.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }

  @override
  $TodoCopyWith<$Res> get todo {
    return $TodoCopyWith<$Res>(_value.todo, (value) {
      return _then(_value.copyWith(todo: value));
    });
  }
}

/// @nodoc

class _$HomePageDeleteButtonPressed implements HomePageDeleteButtonPressed {
  const _$HomePageDeleteButtonPressed(this.todo);

  @override
  final Todo todo;

  @override
  String toString() {
    return 'HomePageEvent.deleteButtonPressed(todo: $todo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageDeleteButtonPressed &&
            const DeepCollectionEquality().equals(other.todo, todo));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(todo));

  @JsonKey(ignore: true)
  @override
  $HomePageDeleteButtonPressedCopyWith<HomePageDeleteButtonPressed>
      get copyWith => _$HomePageDeleteButtonPressedCopyWithImpl<
          HomePageDeleteButtonPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return deleteButtonPressed(todo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return deleteButtonPressed?.call(todo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (deleteButtonPressed != null) {
      return deleteButtonPressed(todo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return deleteButtonPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return deleteButtonPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (deleteButtonPressed != null) {
      return deleteButtonPressed(this);
    }
    return orElse();
  }
}

abstract class HomePageDeleteButtonPressed implements HomePageEvent {
  const factory HomePageDeleteButtonPressed(Todo todo) =
      _$HomePageDeleteButtonPressed;

  Todo get todo;
  @JsonKey(ignore: true)
  $HomePageDeleteButtonPressedCopyWith<HomePageDeleteButtonPressed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageTodoReorderedCopyWith<$Res> {
  factory $HomePageTodoReorderedCopyWith(HomePageTodoReordered value,
          $Res Function(HomePageTodoReordered) then) =
      _$HomePageTodoReorderedCopyWithImpl<$Res>;
  $Res call({int oldIndex, int newIndex});
}

/// @nodoc
class _$HomePageTodoReorderedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageTodoReorderedCopyWith<$Res> {
  _$HomePageTodoReorderedCopyWithImpl(
      HomePageTodoReordered _value, $Res Function(HomePageTodoReordered) _then)
      : super(_value, (v) => _then(v as HomePageTodoReordered));

  @override
  HomePageTodoReordered get _value => super._value as HomePageTodoReordered;

  @override
  $Res call({
    Object? oldIndex = freezed,
    Object? newIndex = freezed,
  }) {
    return _then(HomePageTodoReordered(
      oldIndex == freezed
          ? _value.oldIndex
          : oldIndex // ignore: cast_nullable_to_non_nullable
              as int,
      newIndex == freezed
          ? _value.newIndex
          : newIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HomePageTodoReordered implements HomePageTodoReordered {
  const _$HomePageTodoReordered(this.oldIndex, this.newIndex);

  @override
  final int oldIndex;
  @override
  final int newIndex;

  @override
  String toString() {
    return 'HomePageEvent.todoReorderd(oldIndex: $oldIndex, newIndex: $newIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageTodoReordered &&
            const DeepCollectionEquality().equals(other.oldIndex, oldIndex) &&
            const DeepCollectionEquality().equals(other.newIndex, newIndex));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(oldIndex),
      const DeepCollectionEquality().hash(newIndex));

  @JsonKey(ignore: true)
  @override
  $HomePageTodoReorderedCopyWith<HomePageTodoReordered> get copyWith =>
      _$HomePageTodoReorderedCopyWithImpl<HomePageTodoReordered>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return todoReorderd(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return todoReorderd?.call(oldIndex, newIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (todoReorderd != null) {
      return todoReorderd(oldIndex, newIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return todoReorderd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return todoReorderd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (todoReorderd != null) {
      return todoReorderd(this);
    }
    return orElse();
  }
}

abstract class HomePageTodoReordered implements HomePageEvent {
  const factory HomePageTodoReordered(int oldIndex, int newIndex) =
      _$HomePageTodoReordered;

  int get oldIndex;
  int get newIndex;
  @JsonKey(ignore: true)
  $HomePageTodoReorderedCopyWith<HomePageTodoReordered> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageFiltersChangedCopyWith<$Res> {
  factory $HomePageFiltersChangedCopyWith(HomePageFiltersChanged value,
          $Res Function(HomePageFiltersChanged) then) =
      _$HomePageFiltersChangedCopyWithImpl<$Res>;
  $Res call({bool showRemainedTodos, List<Tag> selectedTags});
}

/// @nodoc
class _$HomePageFiltersChangedCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageFiltersChangedCopyWith<$Res> {
  _$HomePageFiltersChangedCopyWithImpl(HomePageFiltersChanged _value,
      $Res Function(HomePageFiltersChanged) _then)
      : super(_value, (v) => _then(v as HomePageFiltersChanged));

  @override
  HomePageFiltersChanged get _value => super._value as HomePageFiltersChanged;

  @override
  $Res call({
    Object? showRemainedTodos = freezed,
    Object? selectedTags = freezed,
  }) {
    return _then(HomePageFiltersChanged(
      showRemainedTodos == freezed
          ? _value.showRemainedTodos
          : showRemainedTodos // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTags == freezed
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$HomePageFiltersChanged implements HomePageFiltersChanged {
  const _$HomePageFiltersChanged(this.showRemainedTodos, this.selectedTags);

  @override
  final bool showRemainedTodos;
  @override
  final List<Tag> selectedTags;

  @override
  String toString() {
    return 'HomePageEvent.filtersChanged(showRemainedTodos: $showRemainedTodos, selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageFiltersChanged &&
            const DeepCollectionEquality()
                .equals(other.showRemainedTodos, showRemainedTodos) &&
            const DeepCollectionEquality()
                .equals(other.selectedTags, selectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(showRemainedTodos),
      const DeepCollectionEquality().hash(selectedTags));

  @JsonKey(ignore: true)
  @override
  $HomePageFiltersChangedCopyWith<HomePageFiltersChanged> get copyWith =>
      _$HomePageFiltersChangedCopyWithImpl<HomePageFiltersChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return filtersChanged(showRemainedTodos, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return filtersChanged?.call(showRemainedTodos, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(showRemainedTodos, selectedTags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return filtersChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return filtersChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (filtersChanged != null) {
      return filtersChanged(this);
    }
    return orElse();
  }
}

abstract class HomePageFiltersChanged implements HomePageEvent {
  const factory HomePageFiltersChanged(
          bool showRemainedTodos, List<Tag> selectedTags) =
      _$HomePageFiltersChanged;

  bool get showRemainedTodos;
  List<Tag> get selectedTags;
  @JsonKey(ignore: true)
  $HomePageFiltersChangedCopyWith<HomePageFiltersChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageGotbackFromAddTodoPageCopyWith<$Res> {
  factory $HomePageGotbackFromAddTodoPageCopyWith(
          HomePageGotbackFromAddTodoPage value,
          $Res Function(HomePageGotbackFromAddTodoPage) then) =
      _$HomePageGotbackFromAddTodoPageCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageGotbackFromAddTodoPageCopyWithImpl<$Res>
    extends _$HomePageEventCopyWithImpl<$Res>
    implements $HomePageGotbackFromAddTodoPageCopyWith<$Res> {
  _$HomePageGotbackFromAddTodoPageCopyWithImpl(
      HomePageGotbackFromAddTodoPage _value,
      $Res Function(HomePageGotbackFromAddTodoPage) _then)
      : super(_value, (v) => _then(v as HomePageGotbackFromAddTodoPage));

  @override
  HomePageGotbackFromAddTodoPage get _value =>
      super._value as HomePageGotbackFromAddTodoPage;
}

/// @nodoc

class _$HomePageGotbackFromAddTodoPage
    implements HomePageGotbackFromAddTodoPage {
  const _$HomePageGotbackFromAddTodoPage();

  @override
  String toString() {
    return 'HomePageEvent.gotBackFromAddTodoPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageGotbackFromAddTodoPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Todo todo) checkButtonPressed,
    required TResult Function(Todo todo) deleteButtonPressed,
    required TResult Function(int oldIndex, int newIndex) todoReorderd,
    required TResult Function(bool showRemainedTodos, List<Tag> selectedTags)
        filtersChanged,
    required TResult Function() gotBackFromAddTodoPage,
  }) {
    return gotBackFromAddTodoPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
  }) {
    return gotBackFromAddTodoPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Todo todo)? checkButtonPressed,
    TResult Function(Todo todo)? deleteButtonPressed,
    TResult Function(int oldIndex, int newIndex)? todoReorderd,
    TResult Function(bool showRemainedTodos, List<Tag> selectedTags)?
        filtersChanged,
    TResult Function()? gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (gotBackFromAddTodoPage != null) {
      return gotBackFromAddTodoPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitialized value) initialized,
    required TResult Function(HomePageCheckButtonPressed value)
        checkButtonPressed,
    required TResult Function(HomePageDeleteButtonPressed value)
        deleteButtonPressed,
    required TResult Function(HomePageTodoReordered value) todoReorderd,
    required TResult Function(HomePageFiltersChanged value) filtersChanged,
    required TResult Function(HomePageGotbackFromAddTodoPage value)
        gotBackFromAddTodoPage,
  }) {
    return gotBackFromAddTodoPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
  }) {
    return gotBackFromAddTodoPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitialized value)? initialized,
    TResult Function(HomePageCheckButtonPressed value)? checkButtonPressed,
    TResult Function(HomePageDeleteButtonPressed value)? deleteButtonPressed,
    TResult Function(HomePageTodoReordered value)? todoReorderd,
    TResult Function(HomePageFiltersChanged value)? filtersChanged,
    TResult Function(HomePageGotbackFromAddTodoPage value)?
        gotBackFromAddTodoPage,
    required TResult orElse(),
  }) {
    if (gotBackFromAddTodoPage != null) {
      return gotBackFromAddTodoPage(this);
    }
    return orElse();
  }
}

abstract class HomePageGotbackFromAddTodoPage implements HomePageEvent {
  const factory HomePageGotbackFromAddTodoPage() =
      _$HomePageGotbackFromAddTodoPage;
}

/// @nodoc
class _$HomePageStateTearOff {
  const _$HomePageStateTearOff();

  HomePageInitial initial() {
    return const HomePageInitial();
  }

  HomePageSuccess success(
      {required List<Todo> todos,
      required List<Tag> tags,
      required int remainedTodos,
      required bool showRemainedTodos,
      required List<Tag> selectedTags}) {
    return HomePageSuccess(
      todos: todos,
      tags: tags,
      remainedTodos: remainedTodos,
      showRemainedTodos: showRemainedTodos,
      selectedTags: selectedTags,
    );
  }

  HomePageEmpty empty() {
    return const HomePageEmpty();
  }

  HomePageFailure failure() {
    return const HomePageFailure();
  }
}

/// @nodoc
const $HomePageState = _$HomePageStateTearOff();

/// @nodoc
mixin _$HomePageState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Todo> todos, List<Tag> tags,
            int remainedTodos, bool showRemainedTodos, List<Tag> selectedTags)
        success,
    required TResult Function() empty,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitial value) initial,
    required TResult Function(HomePageSuccess value) success,
    required TResult Function(HomePageEmpty value) empty,
    required TResult Function(HomePageFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageStateCopyWith<$Res> {
  factory $HomePageStateCopyWith(
          HomePageState value, $Res Function(HomePageState) then) =
      _$HomePageStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageStateCopyWith<$Res> {
  _$HomePageStateCopyWithImpl(this._value, this._then);

  final HomePageState _value;
  // ignore: unused_field
  final $Res Function(HomePageState) _then;
}

/// @nodoc
abstract class $HomePageInitialCopyWith<$Res> {
  factory $HomePageInitialCopyWith(
          HomePageInitial value, $Res Function(HomePageInitial) then) =
      _$HomePageInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageInitialCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageInitialCopyWith<$Res> {
  _$HomePageInitialCopyWithImpl(
      HomePageInitial _value, $Res Function(HomePageInitial) _then)
      : super(_value, (v) => _then(v as HomePageInitial));

  @override
  HomePageInitial get _value => super._value as HomePageInitial;
}

/// @nodoc

class _$HomePageInitial implements HomePageInitial {
  const _$HomePageInitial();

  @override
  String toString() {
    return 'HomePageState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Todo> todos, List<Tag> tags,
            int remainedTodos, bool showRemainedTodos, List<Tag> selectedTags)
        success,
    required TResult Function() empty,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitial value) initial,
    required TResult Function(HomePageSuccess value) success,
    required TResult Function(HomePageEmpty value) empty,
    required TResult Function(HomePageFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class HomePageInitial implements HomePageState {
  const factory HomePageInitial() = _$HomePageInitial;
}

/// @nodoc
abstract class $HomePageSuccessCopyWith<$Res> {
  factory $HomePageSuccessCopyWith(
          HomePageSuccess value, $Res Function(HomePageSuccess) then) =
      _$HomePageSuccessCopyWithImpl<$Res>;
  $Res call(
      {List<Todo> todos,
      List<Tag> tags,
      int remainedTodos,
      bool showRemainedTodos,
      List<Tag> selectedTags});
}

/// @nodoc
class _$HomePageSuccessCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageSuccessCopyWith<$Res> {
  _$HomePageSuccessCopyWithImpl(
      HomePageSuccess _value, $Res Function(HomePageSuccess) _then)
      : super(_value, (v) => _then(v as HomePageSuccess));

  @override
  HomePageSuccess get _value => super._value as HomePageSuccess;

  @override
  $Res call({
    Object? todos = freezed,
    Object? tags = freezed,
    Object? remainedTodos = freezed,
    Object? showRemainedTodos = freezed,
    Object? selectedTags = freezed,
  }) {
    return _then(HomePageSuccess(
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
      remainedTodos: remainedTodos == freezed
          ? _value.remainedTodos
          : remainedTodos // ignore: cast_nullable_to_non_nullable
              as int,
      showRemainedTodos: showRemainedTodos == freezed
          ? _value.showRemainedTodos
          : showRemainedTodos // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedTags: selectedTags == freezed
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<Tag>,
    ));
  }
}

/// @nodoc

class _$HomePageSuccess implements HomePageSuccess {
  const _$HomePageSuccess(
      {required this.todos,
      required this.tags,
      required this.remainedTodos,
      required this.showRemainedTodos,
      required this.selectedTags});

  @override
  final List<Todo> todos;
  @override
  final List<Tag> tags;
  @override
  final int remainedTodos;
  @override
  final bool showRemainedTodos;
  @override
  final List<Tag> selectedTags;

  @override
  String toString() {
    return 'HomePageState.success(todos: $todos, tags: $tags, remainedTodos: $remainedTodos, showRemainedTodos: $showRemainedTodos, selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomePageSuccess &&
            const DeepCollectionEquality().equals(other.todos, todos) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            const DeepCollectionEquality()
                .equals(other.remainedTodos, remainedTodos) &&
            const DeepCollectionEquality()
                .equals(other.showRemainedTodos, showRemainedTodos) &&
            const DeepCollectionEquality()
                .equals(other.selectedTags, selectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(todos),
      const DeepCollectionEquality().hash(tags),
      const DeepCollectionEquality().hash(remainedTodos),
      const DeepCollectionEquality().hash(showRemainedTodos),
      const DeepCollectionEquality().hash(selectedTags));

  @JsonKey(ignore: true)
  @override
  $HomePageSuccessCopyWith<HomePageSuccess> get copyWith =>
      _$HomePageSuccessCopyWithImpl<HomePageSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Todo> todos, List<Tag> tags,
            int remainedTodos, bool showRemainedTodos, List<Tag> selectedTags)
        success,
    required TResult Function() empty,
    required TResult Function() failure,
  }) {
    return success(todos, tags, remainedTodos, showRemainedTodos, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
  }) {
    return success?.call(
        todos, tags, remainedTodos, showRemainedTodos, selectedTags);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(
          todos, tags, remainedTodos, showRemainedTodos, selectedTags);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitial value) initial,
    required TResult Function(HomePageSuccess value) success,
    required TResult Function(HomePageEmpty value) empty,
    required TResult Function(HomePageFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class HomePageSuccess implements HomePageState {
  const factory HomePageSuccess(
      {required List<Todo> todos,
      required List<Tag> tags,
      required int remainedTodos,
      required bool showRemainedTodos,
      required List<Tag> selectedTags}) = _$HomePageSuccess;

  List<Todo> get todos;
  List<Tag> get tags;
  int get remainedTodos;
  bool get showRemainedTodos;
  List<Tag> get selectedTags;
  @JsonKey(ignore: true)
  $HomePageSuccessCopyWith<HomePageSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomePageEmptyCopyWith<$Res> {
  factory $HomePageEmptyCopyWith(
          HomePageEmpty value, $Res Function(HomePageEmpty) then) =
      _$HomePageEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageEmptyCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageEmptyCopyWith<$Res> {
  _$HomePageEmptyCopyWithImpl(
      HomePageEmpty _value, $Res Function(HomePageEmpty) _then)
      : super(_value, (v) => _then(v as HomePageEmpty));

  @override
  HomePageEmpty get _value => super._value as HomePageEmpty;
}

/// @nodoc

class _$HomePageEmpty implements HomePageEmpty {
  const _$HomePageEmpty();

  @override
  String toString() {
    return 'HomePageState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Todo> todos, List<Tag> tags,
            int remainedTodos, bool showRemainedTodos, List<Tag> selectedTags)
        success,
    required TResult Function() empty,
    required TResult Function() failure,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitial value) initial,
    required TResult Function(HomePageSuccess value) success,
    required TResult Function(HomePageEmpty value) empty,
    required TResult Function(HomePageFailure value) failure,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class HomePageEmpty implements HomePageState {
  const factory HomePageEmpty() = _$HomePageEmpty;
}

/// @nodoc
abstract class $HomePageFailureCopyWith<$Res> {
  factory $HomePageFailureCopyWith(
          HomePageFailure value, $Res Function(HomePageFailure) then) =
      _$HomePageFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomePageFailureCopyWithImpl<$Res>
    extends _$HomePageStateCopyWithImpl<$Res>
    implements $HomePageFailureCopyWith<$Res> {
  _$HomePageFailureCopyWithImpl(
      HomePageFailure _value, $Res Function(HomePageFailure) _then)
      : super(_value, (v) => _then(v as HomePageFailure));

  @override
  HomePageFailure get _value => super._value as HomePageFailure;
}

/// @nodoc

class _$HomePageFailure implements HomePageFailure {
  const _$HomePageFailure();

  @override
  String toString() {
    return 'HomePageState.failure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomePageFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(List<Todo> todos, List<Tag> tags,
            int remainedTodos, bool showRemainedTodos, List<Tag> selectedTags)
        success,
    required TResult Function() empty,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(List<Todo> todos, List<Tag> tags, int remainedTodos,
            bool showRemainedTodos, List<Tag> selectedTags)?
        success,
    TResult Function()? empty,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HomePageInitial value) initial,
    required TResult Function(HomePageSuccess value) success,
    required TResult Function(HomePageEmpty value) empty,
    required TResult Function(HomePageFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HomePageInitial value)? initial,
    TResult Function(HomePageSuccess value)? success,
    TResult Function(HomePageEmpty value)? empty,
    TResult Function(HomePageFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class HomePageFailure implements HomePageState {
  const factory HomePageFailure() = _$HomePageFailure;
}
