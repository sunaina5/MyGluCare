// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prediction_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PredictionHistory _$PredictionHistoryFromJson(Map<String, dynamic> json) =>
    _PredictionHistory(
      id: json['id'] as String?,
      predicted_bg: (json['predicted_bg'] as num?)?.toDouble(),
      user_id: json['user_id'] as String?,
      status: json['status'] as String?,
      risk_level: json['risk_level'] as String?,
      interpretation: json['interpretation'] as String?,
      advice: json['advice'] as String?,
      insulin_suggestion: json['insulin_suggestion'] as String?,
      activity_suggestion: json['activity_suggestion'] as String?,
      next_dose: const TimestampConverter().fromJson(json['next_dose']),
      next_insulin_check_suggested_at: const TimestampConverter()
          .fromJson(json['next_insulin_check_suggested_at']),
      input_summary: json['input_summary'] == null
          ? null
          : InputSummary.fromJson(
              json['input_summary'] as Map<String, dynamic>),
      timestamp: const TimestampConverter().fromJson(json['timestamp']),
    );

Map<String, dynamic> _$PredictionHistoryToJson(_PredictionHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'predicted_bg': instance.predicted_bg,
      'user_id': instance.user_id,
      'status': instance.status,
      'risk_level': instance.risk_level,
      'interpretation': instance.interpretation,
      'advice': instance.advice,
      'insulin_suggestion': instance.insulin_suggestion,
      'activity_suggestion': instance.activity_suggestion,
      'next_dose': const TimestampConverter().toJson(instance.next_dose),
      'next_insulin_check_suggested_at': const TimestampConverter()
          .toJson(instance.next_insulin_check_suggested_at),
      'input_summary': instance.input_summary,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
    };

_InputSummary _$InputSummaryFromJson(Map<String, dynamic> json) =>
    _InputSummary(
      bg_mean: (json['bg_mean'] as num?)?.toDouble(),
      insulin_mean: (json['insulin_mean'] as num?)?.toDouble(),
      carbs_mean: (json['carbs_mean'] as num?)?.toDouble(),
      steps_mean: (json['steps_mean'] as num?)?.toDouble(),
      hr_mean: (json['hr_mean'] as num?)?.toDouble(),
      cals_mean: (json['cals_mean'] as num?)?.toDouble(),
      activity_encoded: (json['activity_encoded'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InputSummaryToJson(_InputSummary instance) =>
    <String, dynamic>{
      'bg_mean': instance.bg_mean,
      'insulin_mean': instance.insulin_mean,
      'carbs_mean': instance.carbs_mean,
      'steps_mean': instance.steps_mean,
      'hr_mean': instance.hr_mean,
      'cals_mean': instance.cals_mean,
      'activity_encoded': instance.activity_encoded,
    };
