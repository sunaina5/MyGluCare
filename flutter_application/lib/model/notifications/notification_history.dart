import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_application/converter/timestamp_converter.dart';

part 'notification_history.freezed.dart';
part 'notification_history.g.dart';

@freezed
 abstract class NotificationHistory with _$NotificationHistory {
  const factory NotificationHistory({
    String? id,
    String? title,
    String? body,
    String? type, // e.g., 'insulin_check', 'glucose_reminder', etc.
    @TimestampConverter() DateTime? scheduledTime,
    @TimestampConverter() DateTime? triggeredTime,
    String? relatedPredictionId,
  }) = _NotificationHistory;

  factory NotificationHistory.fromJson(Map<String, dynamic> json) =>
      _$NotificationHistoryFromJson(json);
}
