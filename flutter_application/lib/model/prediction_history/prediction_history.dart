
import 'package:flutter_application/converter/timestamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'prediction_history.freezed.dart';
part 'prediction_history.g.dart';

@freezed
abstract class PredictionHistory with _$PredictionHistory {

  const factory PredictionHistory({
      String? id,
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
      @TimestampConverter() DateTime? timestamp,

  }) = _PredictionHistory;

  factory PredictionHistory.fromJson(Map<String, dynamic> json) =>
      _$PredictionHistoryFromJson(json);
}

@freezed
abstract class InputSummary with _$InputSummary {
  const factory InputSummary({
     double? bg_mean,
     double? insulin_mean,
     double? carbs_mean,
     double? steps_mean,
     double? hr_mean,
     double? cals_mean,
     int? activity_encoded,
  }) = _InputSummary;

  factory InputSummary.fromJson(Map<String, dynamic> json) =>
      _$InputSummaryFromJson(json);
}