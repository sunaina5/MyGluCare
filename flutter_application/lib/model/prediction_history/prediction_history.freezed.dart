// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prediction_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PredictionHistory {
  String? get id;
  double? get predicted_bg;
  String? get user_id;
  String? get status;
  String? get risk_level;
  String? get interpretation;
  String? get advice;
  String? get insulin_suggestion;
  String? get activity_suggestion;
  @TimestampConverter()
  DateTime? get next_dose;
  @TimestampConverter()
  DateTime? get next_insulin_check_suggested_at;
  InputSummary? get input_summary;
  @TimestampConverter()
  DateTime? get timestamp;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PredictionHistoryCopyWith<PredictionHistory> get copyWith =>
      _$PredictionHistoryCopyWithImpl<PredictionHistory>(
          this as PredictionHistory, _$identity);

  /// Serializes this PredictionHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PredictionHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.predicted_bg, predicted_bg) ||
                other.predicted_bg == predicted_bg) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.risk_level, risk_level) ||
                other.risk_level == risk_level) &&
            (identical(other.interpretation, interpretation) ||
                other.interpretation == interpretation) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.insulin_suggestion, insulin_suggestion) ||
                other.insulin_suggestion == insulin_suggestion) &&
            (identical(other.activity_suggestion, activity_suggestion) ||
                other.activity_suggestion == activity_suggestion) &&
            (identical(other.next_dose, next_dose) ||
                other.next_dose == next_dose) &&
            (identical(other.next_insulin_check_suggested_at,
                    next_insulin_check_suggested_at) ||
                other.next_insulin_check_suggested_at ==
                    next_insulin_check_suggested_at) &&
            (identical(other.input_summary, input_summary) ||
                other.input_summary == input_summary) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      predicted_bg,
      user_id,
      status,
      risk_level,
      interpretation,
      advice,
      insulin_suggestion,
      activity_suggestion,
      next_dose,
      next_insulin_check_suggested_at,
      input_summary,
      timestamp);

  @override
  String toString() {
    return 'PredictionHistory(id: $id, predicted_bg: $predicted_bg, user_id: $user_id, status: $status, risk_level: $risk_level, interpretation: $interpretation, advice: $advice, insulin_suggestion: $insulin_suggestion, activity_suggestion: $activity_suggestion, next_dose: $next_dose, next_insulin_check_suggested_at: $next_insulin_check_suggested_at, input_summary: $input_summary, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class $PredictionHistoryCopyWith<$Res> {
  factory $PredictionHistoryCopyWith(
          PredictionHistory value, $Res Function(PredictionHistory) _then) =
      _$PredictionHistoryCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      double? predicted_bg,
      String? user_id,
      String? status,
      String? risk_level,
      String? interpretation,
      String? advice,
      String? insulin_suggestion,
      String? activity_suggestion,
      @TimestampConverter() DateTime? next_dose,
      @TimestampConverter() DateTime? next_insulin_check_suggested_at,
      InputSummary? input_summary,
      @TimestampConverter() DateTime? timestamp});

  $InputSummaryCopyWith<$Res>? get input_summary;
}

/// @nodoc
class _$PredictionHistoryCopyWithImpl<$Res>
    implements $PredictionHistoryCopyWith<$Res> {
  _$PredictionHistoryCopyWithImpl(this._self, this._then);

  final PredictionHistory _self;
  final $Res Function(PredictionHistory) _then;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? predicted_bg = freezed,
    Object? user_id = freezed,
    Object? status = freezed,
    Object? risk_level = freezed,
    Object? interpretation = freezed,
    Object? advice = freezed,
    Object? insulin_suggestion = freezed,
    Object? activity_suggestion = freezed,
    Object? next_dose = freezed,
    Object? next_insulin_check_suggested_at = freezed,
    Object? input_summary = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      predicted_bg: freezed == predicted_bg
          ? _self.predicted_bg
          : predicted_bg // ignore: cast_nullable_to_non_nullable
              as double?,
      user_id: freezed == user_id
          ? _self.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      risk_level: freezed == risk_level
          ? _self.risk_level
          : risk_level // ignore: cast_nullable_to_non_nullable
              as String?,
      interpretation: freezed == interpretation
          ? _self.interpretation
          : interpretation // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
      insulin_suggestion: freezed == insulin_suggestion
          ? _self.insulin_suggestion
          : insulin_suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      activity_suggestion: freezed == activity_suggestion
          ? _self.activity_suggestion
          : activity_suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      next_dose: freezed == next_dose
          ? _self.next_dose
          : next_dose // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      next_insulin_check_suggested_at: freezed ==
              next_insulin_check_suggested_at
          ? _self.next_insulin_check_suggested_at
          : next_insulin_check_suggested_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      input_summary: freezed == input_summary
          ? _self.input_summary
          : input_summary // ignore: cast_nullable_to_non_nullable
              as InputSummary?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputSummaryCopyWith<$Res>? get input_summary {
    if (_self.input_summary == null) {
      return null;
    }

    return $InputSummaryCopyWith<$Res>(_self.input_summary!, (value) {
      return _then(_self.copyWith(input_summary: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _PredictionHistory implements PredictionHistory {
  const _PredictionHistory(
      {this.id,
      this.predicted_bg,
      this.user_id,
      this.status,
      this.risk_level,
      this.interpretation,
      this.advice,
      this.insulin_suggestion,
      this.activity_suggestion,
      @TimestampConverter() this.next_dose,
      @TimestampConverter() this.next_insulin_check_suggested_at,
      this.input_summary,
      @TimestampConverter() this.timestamp});
  factory _PredictionHistory.fromJson(Map<String, dynamic> json) =>
      _$PredictionHistoryFromJson(json);

  @override
  final String? id;
  @override
  final double? predicted_bg;
  @override
  final String? user_id;
  @override
  final String? status;
  @override
  final String? risk_level;
  @override
  final String? interpretation;
  @override
  final String? advice;
  @override
  final String? insulin_suggestion;
  @override
  final String? activity_suggestion;
  @override
  @TimestampConverter()
  final DateTime? next_dose;
  @override
  @TimestampConverter()
  final DateTime? next_insulin_check_suggested_at;
  @override
  final InputSummary? input_summary;
  @override
  @TimestampConverter()
  final DateTime? timestamp;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PredictionHistoryCopyWith<_PredictionHistory> get copyWith =>
      __$PredictionHistoryCopyWithImpl<_PredictionHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PredictionHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PredictionHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.predicted_bg, predicted_bg) ||
                other.predicted_bg == predicted_bg) &&
            (identical(other.user_id, user_id) || other.user_id == user_id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.risk_level, risk_level) ||
                other.risk_level == risk_level) &&
            (identical(other.interpretation, interpretation) ||
                other.interpretation == interpretation) &&
            (identical(other.advice, advice) || other.advice == advice) &&
            (identical(other.insulin_suggestion, insulin_suggestion) ||
                other.insulin_suggestion == insulin_suggestion) &&
            (identical(other.activity_suggestion, activity_suggestion) ||
                other.activity_suggestion == activity_suggestion) &&
            (identical(other.next_dose, next_dose) ||
                other.next_dose == next_dose) &&
            (identical(other.next_insulin_check_suggested_at,
                    next_insulin_check_suggested_at) ||
                other.next_insulin_check_suggested_at ==
                    next_insulin_check_suggested_at) &&
            (identical(other.input_summary, input_summary) ||
                other.input_summary == input_summary) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      predicted_bg,
      user_id,
      status,
      risk_level,
      interpretation,
      advice,
      insulin_suggestion,
      activity_suggestion,
      next_dose,
      next_insulin_check_suggested_at,
      input_summary,
      timestamp);

  @override
  String toString() {
    return 'PredictionHistory(id: $id, predicted_bg: $predicted_bg, user_id: $user_id, status: $status, risk_level: $risk_level, interpretation: $interpretation, advice: $advice, insulin_suggestion: $insulin_suggestion, activity_suggestion: $activity_suggestion, next_dose: $next_dose, next_insulin_check_suggested_at: $next_insulin_check_suggested_at, input_summary: $input_summary, timestamp: $timestamp)';
  }
}

/// @nodoc
abstract mixin class _$PredictionHistoryCopyWith<$Res>
    implements $PredictionHistoryCopyWith<$Res> {
  factory _$PredictionHistoryCopyWith(
          _PredictionHistory value, $Res Function(_PredictionHistory) _then) =
      __$PredictionHistoryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      double? predicted_bg,
      String? user_id,
      String? status,
      String? risk_level,
      String? interpretation,
      String? advice,
      String? insulin_suggestion,
      String? activity_suggestion,
      @TimestampConverter() DateTime? next_dose,
      @TimestampConverter() DateTime? next_insulin_check_suggested_at,
      InputSummary? input_summary,
      @TimestampConverter() DateTime? timestamp});

  @override
  $InputSummaryCopyWith<$Res>? get input_summary;
}

/// @nodoc
class __$PredictionHistoryCopyWithImpl<$Res>
    implements _$PredictionHistoryCopyWith<$Res> {
  __$PredictionHistoryCopyWithImpl(this._self, this._then);

  final _PredictionHistory _self;
  final $Res Function(_PredictionHistory) _then;

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? predicted_bg = freezed,
    Object? user_id = freezed,
    Object? status = freezed,
    Object? risk_level = freezed,
    Object? interpretation = freezed,
    Object? advice = freezed,
    Object? insulin_suggestion = freezed,
    Object? activity_suggestion = freezed,
    Object? next_dose = freezed,
    Object? next_insulin_check_suggested_at = freezed,
    Object? input_summary = freezed,
    Object? timestamp = freezed,
  }) {
    return _then(_PredictionHistory(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      predicted_bg: freezed == predicted_bg
          ? _self.predicted_bg
          : predicted_bg // ignore: cast_nullable_to_non_nullable
              as double?,
      user_id: freezed == user_id
          ? _self.user_id
          : user_id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      risk_level: freezed == risk_level
          ? _self.risk_level
          : risk_level // ignore: cast_nullable_to_non_nullable
              as String?,
      interpretation: freezed == interpretation
          ? _self.interpretation
          : interpretation // ignore: cast_nullable_to_non_nullable
              as String?,
      advice: freezed == advice
          ? _self.advice
          : advice // ignore: cast_nullable_to_non_nullable
              as String?,
      insulin_suggestion: freezed == insulin_suggestion
          ? _self.insulin_suggestion
          : insulin_suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      activity_suggestion: freezed == activity_suggestion
          ? _self.activity_suggestion
          : activity_suggestion // ignore: cast_nullable_to_non_nullable
              as String?,
      next_dose: freezed == next_dose
          ? _self.next_dose
          : next_dose // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      next_insulin_check_suggested_at: freezed ==
              next_insulin_check_suggested_at
          ? _self.next_insulin_check_suggested_at
          : next_insulin_check_suggested_at // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      input_summary: freezed == input_summary
          ? _self.input_summary
          : input_summary // ignore: cast_nullable_to_non_nullable
              as InputSummary?,
      timestamp: freezed == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of PredictionHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InputSummaryCopyWith<$Res>? get input_summary {
    if (_self.input_summary == null) {
      return null;
    }

    return $InputSummaryCopyWith<$Res>(_self.input_summary!, (value) {
      return _then(_self.copyWith(input_summary: value));
    });
  }
}

/// @nodoc
mixin _$InputSummary {
  double? get bg_mean;
  double? get insulin_mean;
  double? get carbs_mean;
  double? get steps_mean;
  double? get hr_mean;
  double? get cals_mean;
  int? get activity_encoded;

  /// Create a copy of InputSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InputSummaryCopyWith<InputSummary> get copyWith =>
      _$InputSummaryCopyWithImpl<InputSummary>(
          this as InputSummary, _$identity);

  /// Serializes this InputSummary to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InputSummary &&
            (identical(other.bg_mean, bg_mean) || other.bg_mean == bg_mean) &&
            (identical(other.insulin_mean, insulin_mean) ||
                other.insulin_mean == insulin_mean) &&
            (identical(other.carbs_mean, carbs_mean) ||
                other.carbs_mean == carbs_mean) &&
            (identical(other.steps_mean, steps_mean) ||
                other.steps_mean == steps_mean) &&
            (identical(other.hr_mean, hr_mean) || other.hr_mean == hr_mean) &&
            (identical(other.cals_mean, cals_mean) ||
                other.cals_mean == cals_mean) &&
            (identical(other.activity_encoded, activity_encoded) ||
                other.activity_encoded == activity_encoded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bg_mean, insulin_mean,
      carbs_mean, steps_mean, hr_mean, cals_mean, activity_encoded);

  @override
  String toString() {
    return 'InputSummary(bg_mean: $bg_mean, insulin_mean: $insulin_mean, carbs_mean: $carbs_mean, steps_mean: $steps_mean, hr_mean: $hr_mean, cals_mean: $cals_mean, activity_encoded: $activity_encoded)';
  }
}

/// @nodoc
abstract mixin class $InputSummaryCopyWith<$Res> {
  factory $InputSummaryCopyWith(
          InputSummary value, $Res Function(InputSummary) _then) =
      _$InputSummaryCopyWithImpl;
  @useResult
  $Res call(
      {double? bg_mean,
      double? insulin_mean,
      double? carbs_mean,
      double? steps_mean,
      double? hr_mean,
      double? cals_mean,
      int? activity_encoded});
}

/// @nodoc
class _$InputSummaryCopyWithImpl<$Res> implements $InputSummaryCopyWith<$Res> {
  _$InputSummaryCopyWithImpl(this._self, this._then);

  final InputSummary _self;
  final $Res Function(InputSummary) _then;

  /// Create a copy of InputSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bg_mean = freezed,
    Object? insulin_mean = freezed,
    Object? carbs_mean = freezed,
    Object? steps_mean = freezed,
    Object? hr_mean = freezed,
    Object? cals_mean = freezed,
    Object? activity_encoded = freezed,
  }) {
    return _then(_self.copyWith(
      bg_mean: freezed == bg_mean
          ? _self.bg_mean
          : bg_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      insulin_mean: freezed == insulin_mean
          ? _self.insulin_mean
          : insulin_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      carbs_mean: freezed == carbs_mean
          ? _self.carbs_mean
          : carbs_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      steps_mean: freezed == steps_mean
          ? _self.steps_mean
          : steps_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      hr_mean: freezed == hr_mean
          ? _self.hr_mean
          : hr_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      cals_mean: freezed == cals_mean
          ? _self.cals_mean
          : cals_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      activity_encoded: freezed == activity_encoded
          ? _self.activity_encoded
          : activity_encoded // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InputSummary implements InputSummary {
  const _InputSummary(
      {this.bg_mean,
      this.insulin_mean,
      this.carbs_mean,
      this.steps_mean,
      this.hr_mean,
      this.cals_mean,
      this.activity_encoded});
  factory _InputSummary.fromJson(Map<String, dynamic> json) =>
      _$InputSummaryFromJson(json);

  @override
  final double? bg_mean;
  @override
  final double? insulin_mean;
  @override
  final double? carbs_mean;
  @override
  final double? steps_mean;
  @override
  final double? hr_mean;
  @override
  final double? cals_mean;
  @override
  final int? activity_encoded;

  /// Create a copy of InputSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InputSummaryCopyWith<_InputSummary> get copyWith =>
      __$InputSummaryCopyWithImpl<_InputSummary>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InputSummaryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InputSummary &&
            (identical(other.bg_mean, bg_mean) || other.bg_mean == bg_mean) &&
            (identical(other.insulin_mean, insulin_mean) ||
                other.insulin_mean == insulin_mean) &&
            (identical(other.carbs_mean, carbs_mean) ||
                other.carbs_mean == carbs_mean) &&
            (identical(other.steps_mean, steps_mean) ||
                other.steps_mean == steps_mean) &&
            (identical(other.hr_mean, hr_mean) || other.hr_mean == hr_mean) &&
            (identical(other.cals_mean, cals_mean) ||
                other.cals_mean == cals_mean) &&
            (identical(other.activity_encoded, activity_encoded) ||
                other.activity_encoded == activity_encoded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, bg_mean, insulin_mean,
      carbs_mean, steps_mean, hr_mean, cals_mean, activity_encoded);

  @override
  String toString() {
    return 'InputSummary(bg_mean: $bg_mean, insulin_mean: $insulin_mean, carbs_mean: $carbs_mean, steps_mean: $steps_mean, hr_mean: $hr_mean, cals_mean: $cals_mean, activity_encoded: $activity_encoded)';
  }
}

/// @nodoc
abstract mixin class _$InputSummaryCopyWith<$Res>
    implements $InputSummaryCopyWith<$Res> {
  factory _$InputSummaryCopyWith(
          _InputSummary value, $Res Function(_InputSummary) _then) =
      __$InputSummaryCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double? bg_mean,
      double? insulin_mean,
      double? carbs_mean,
      double? steps_mean,
      double? hr_mean,
      double? cals_mean,
      int? activity_encoded});
}

/// @nodoc
class __$InputSummaryCopyWithImpl<$Res>
    implements _$InputSummaryCopyWith<$Res> {
  __$InputSummaryCopyWithImpl(this._self, this._then);

  final _InputSummary _self;
  final $Res Function(_InputSummary) _then;

  /// Create a copy of InputSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? bg_mean = freezed,
    Object? insulin_mean = freezed,
    Object? carbs_mean = freezed,
    Object? steps_mean = freezed,
    Object? hr_mean = freezed,
    Object? cals_mean = freezed,
    Object? activity_encoded = freezed,
  }) {
    return _then(_InputSummary(
      bg_mean: freezed == bg_mean
          ? _self.bg_mean
          : bg_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      insulin_mean: freezed == insulin_mean
          ? _self.insulin_mean
          : insulin_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      carbs_mean: freezed == carbs_mean
          ? _self.carbs_mean
          : carbs_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      steps_mean: freezed == steps_mean
          ? _self.steps_mean
          : steps_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      hr_mean: freezed == hr_mean
          ? _self.hr_mean
          : hr_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      cals_mean: freezed == cals_mean
          ? _self.cals_mean
          : cals_mean // ignore: cast_nullable_to_non_nullable
              as double?,
      activity_encoded: freezed == activity_encoded
          ? _self.activity_encoded
          : activity_encoded // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
