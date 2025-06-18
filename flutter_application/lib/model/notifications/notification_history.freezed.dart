// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationHistory {
  String? get id;
  String? get title;
  String? get body;
  String? get type; // e.g., 'insulin_check', 'glucose_reminder', etc.
  @TimestampConverter()
  DateTime? get scheduledTime;
  @TimestampConverter()
  DateTime? get triggeredTime;
  String? get relatedPredictionId;

  /// Create a copy of NotificationHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationHistoryCopyWith<NotificationHistory> get copyWith =>
      _$NotificationHistoryCopyWithImpl<NotificationHistory>(
          this as NotificationHistory, _$identity);

  /// Serializes this NotificationHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.triggeredTime, triggeredTime) ||
                other.triggeredTime == triggeredTime) &&
            (identical(other.relatedPredictionId, relatedPredictionId) ||
                other.relatedPredictionId == relatedPredictionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, type,
      scheduledTime, triggeredTime, relatedPredictionId);

  @override
  String toString() {
    return 'NotificationHistory(id: $id, title: $title, body: $body, type: $type, scheduledTime: $scheduledTime, triggeredTime: $triggeredTime, relatedPredictionId: $relatedPredictionId)';
  }
}

/// @nodoc
abstract mixin class $NotificationHistoryCopyWith<$Res> {
  factory $NotificationHistoryCopyWith(
          NotificationHistory value, $Res Function(NotificationHistory) _then) =
      _$NotificationHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? body,
      String? type,
      @TimestampConverter() DateTime? scheduledTime,
      @TimestampConverter() DateTime? triggeredTime,
      String? relatedPredictionId});
}

/// @nodoc
class _$NotificationHistoryCopyWithImpl<$Res>
    implements $NotificationHistoryCopyWith<$Res> {
  _$NotificationHistoryCopyWithImpl(this._self, this._then);

  final NotificationHistory _self;
  final $Res Function(NotificationHistory) _then;

  /// Create a copy of NotificationHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? scheduledTime = freezed,
    Object? triggeredTime = freezed,
    Object? relatedPredictionId = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledTime: freezed == scheduledTime
          ? _self.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      triggeredTime: freezed == triggeredTime
          ? _self.triggeredTime
          : triggeredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relatedPredictionId: freezed == relatedPredictionId
          ? _self.relatedPredictionId
          : relatedPredictionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationHistory implements NotificationHistory {
  const _NotificationHistory(
      {this.id,
      this.title,
      this.body,
      this.type,
      @TimestampConverter() this.scheduledTime,
      @TimestampConverter() this.triggeredTime,
      this.relatedPredictionId});
  factory _NotificationHistory.fromJson(Map<String, dynamic> json) =>
      _$NotificationHistoryFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? body;
  @override
  final String? type;
// e.g., 'insulin_check', 'glucose_reminder', etc.
  @override
  @TimestampConverter()
  final DateTime? scheduledTime;
  @override
  @TimestampConverter()
  final DateTime? triggeredTime;
  @override
  final String? relatedPredictionId;

  /// Create a copy of NotificationHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationHistoryCopyWith<_NotificationHistory> get copyWith =>
      __$NotificationHistoryCopyWithImpl<_NotificationHistory>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.scheduledTime, scheduledTime) ||
                other.scheduledTime == scheduledTime) &&
            (identical(other.triggeredTime, triggeredTime) ||
                other.triggeredTime == triggeredTime) &&
            (identical(other.relatedPredictionId, relatedPredictionId) ||
                other.relatedPredictionId == relatedPredictionId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, body, type,
      scheduledTime, triggeredTime, relatedPredictionId);

  @override
  String toString() {
    return 'NotificationHistory(id: $id, title: $title, body: $body, type: $type, scheduledTime: $scheduledTime, triggeredTime: $triggeredTime, relatedPredictionId: $relatedPredictionId)';
  }
}

/// @nodoc
abstract mixin class _$NotificationHistoryCopyWith<$Res>
    implements $NotificationHistoryCopyWith<$Res> {
  factory _$NotificationHistoryCopyWith(_NotificationHistory value,
          $Res Function(_NotificationHistory) _then) =
      __$NotificationHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      String? body,
      String? type,
      @TimestampConverter() DateTime? scheduledTime,
      @TimestampConverter() DateTime? triggeredTime,
      String? relatedPredictionId});
}

/// @nodoc
class __$NotificationHistoryCopyWithImpl<$Res>
    implements _$NotificationHistoryCopyWith<$Res> {
  __$NotificationHistoryCopyWithImpl(this._self, this._then);

  final _NotificationHistory _self;
  final $Res Function(_NotificationHistory) _then;

  /// Create a copy of NotificationHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? body = freezed,
    Object? type = freezed,
    Object? scheduledTime = freezed,
    Object? triggeredTime = freezed,
    Object? relatedPredictionId = freezed,
  }) {
    return _then(_NotificationHistory(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _self.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledTime: freezed == scheduledTime
          ? _self.scheduledTime
          : scheduledTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      triggeredTime: freezed == triggeredTime
          ? _self.triggeredTime
          : triggeredTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      relatedPredictionId: freezed == relatedPredictionId
          ? _self.relatedPredictionId
          : relatedPredictionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
