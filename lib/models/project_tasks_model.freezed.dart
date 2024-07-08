// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_tasks_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectTasks _$ProjectTasksFromJson(Map<String, dynamic> json) {
  return _ProjectTasks.fromJson(json);
}

/// @nodoc
mixin _$ProjectTasks {
  int? get id => throw _privateConstructorUsedError;
  @BoolStringConverter()
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_deadline')
  @BoolDateTimeConverter()
  DateTime? get dateDeadline => throw _privateConstructorUsedError;
  @JsonKey(name: 'sale_line_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get saleLineId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectTasksCopyWith<ProjectTasks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectTasksCopyWith<$Res> {
  factory $ProjectTasksCopyWith(
          ProjectTasks value, $Res Function(ProjectTasks) then) =
      _$ProjectTasksCopyWithImpl<$Res, ProjectTasks>;
  @useResult
  $Res call(
      {int? id,
      @BoolStringConverter() String name,
      @JsonKey(name: 'date_deadline')
      @BoolDateTimeConverter()
      DateTime? dateDeadline,
      @JsonKey(name: 'sale_line_id')
      @BoolRefferedByConverter()
      DisplayNameModel? saleLineId});

  $DisplayNameModelCopyWith<$Res>? get saleLineId;
}

/// @nodoc
class _$ProjectTasksCopyWithImpl<$Res, $Val extends ProjectTasks>
    implements $ProjectTasksCopyWith<$Res> {
  _$ProjectTasksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? dateDeadline = freezed,
    Object? saleLineId = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateDeadline: freezed == dateDeadline
          ? _value.dateDeadline
          : dateDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleLineId: freezed == saleLineId
          ? _value.saleLineId
          : saleLineId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DisplayNameModelCopyWith<$Res>? get saleLineId {
    if (_value.saleLineId == null) {
      return null;
    }

    return $DisplayNameModelCopyWith<$Res>(_value.saleLineId!, (value) {
      return _then(_value.copyWith(saleLineId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectTasksImplCopyWith<$Res>
    implements $ProjectTasksCopyWith<$Res> {
  factory _$$ProjectTasksImplCopyWith(
          _$ProjectTasksImpl value, $Res Function(_$ProjectTasksImpl) then) =
      __$$ProjectTasksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @BoolStringConverter() String name,
      @JsonKey(name: 'date_deadline')
      @BoolDateTimeConverter()
      DateTime? dateDeadline,
      @JsonKey(name: 'sale_line_id')
      @BoolRefferedByConverter()
      DisplayNameModel? saleLineId});

  @override
  $DisplayNameModelCopyWith<$Res>? get saleLineId;
}

/// @nodoc
class __$$ProjectTasksImplCopyWithImpl<$Res>
    extends _$ProjectTasksCopyWithImpl<$Res, _$ProjectTasksImpl>
    implements _$$ProjectTasksImplCopyWith<$Res> {
  __$$ProjectTasksImplCopyWithImpl(
      _$ProjectTasksImpl _value, $Res Function(_$ProjectTasksImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? dateDeadline = freezed,
    Object? saleLineId = freezed,
  }) {
    return _then(_$ProjectTasksImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      dateDeadline: freezed == dateDeadline
          ? _value.dateDeadline
          : dateDeadline // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      saleLineId: freezed == saleLineId
          ? _value.saleLineId
          : saleLineId // ignore: cast_nullable_to_non_nullable
              as DisplayNameModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectTasksImpl implements _ProjectTasks {
  const _$ProjectTasksImpl(
      {required this.id,
      @BoolStringConverter() required this.name,
      @JsonKey(name: 'date_deadline')
      @BoolDateTimeConverter()
      required this.dateDeadline,
      @JsonKey(name: 'sale_line_id')
      @BoolRefferedByConverter()
      required this.saleLineId});

  factory _$ProjectTasksImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProjectTasksImplFromJson(json);

  @override
  final int? id;
  @override
  @BoolStringConverter()
  final String name;
  @override
  @JsonKey(name: 'date_deadline')
  @BoolDateTimeConverter()
  final DateTime? dateDeadline;
  @override
  @JsonKey(name: 'sale_line_id')
  @BoolRefferedByConverter()
  final DisplayNameModel? saleLineId;

  @override
  String toString() {
    return 'ProjectTasks(id: $id, name: $name, dateDeadline: $dateDeadline, saleLineId: $saleLineId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectTasksImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.dateDeadline, dateDeadline) ||
                other.dateDeadline == dateDeadline) &&
            (identical(other.saleLineId, saleLineId) ||
                other.saleLineId == saleLineId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, dateDeadline, saleLineId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectTasksImplCopyWith<_$ProjectTasksImpl> get copyWith =>
      __$$ProjectTasksImplCopyWithImpl<_$ProjectTasksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectTasksImplToJson(
      this,
    );
  }
}

abstract class _ProjectTasks implements ProjectTasks {
  const factory _ProjectTasks(
      {required final int? id,
      @BoolStringConverter() required final String name,
      @JsonKey(name: 'date_deadline')
      @BoolDateTimeConverter()
      required final DateTime? dateDeadline,
      @JsonKey(name: 'sale_line_id')
      @BoolRefferedByConverter()
      required final DisplayNameModel? saleLineId}) = _$ProjectTasksImpl;

  factory _ProjectTasks.fromJson(Map<String, dynamic> json) =
      _$ProjectTasksImpl.fromJson;

  @override
  int? get id;
  @override
  @BoolStringConverter()
  String get name;
  @override
  @JsonKey(name: 'date_deadline')
  @BoolDateTimeConverter()
  DateTime? get dateDeadline;
  @override
  @JsonKey(name: 'sale_line_id')
  @BoolRefferedByConverter()
  DisplayNameModel? get saleLineId;
  @override
  @JsonKey(ignore: true)
  _$$ProjectTasksImplCopyWith<_$ProjectTasksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
