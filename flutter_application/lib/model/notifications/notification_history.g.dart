// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationHistory _$NotificationHistoryFromJson(Map<String, dynamic> json) =>
    _NotificationHistory(
      id: json['id'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      type: json['type'] as String?,
      scheduledTime: const TimestampConverter().fromJson(json['scheduledTime']),
      triggeredTime: const TimestampConverter().fromJson(json['triggeredTime']),
      relatedPredictionId: json['relatedPredictionId'] as String?,
    );

Map<String, dynamic> _$NotificationHistoryToJson(
        _NotificationHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'scheduledTime':
          const TimestampConverter().toJson(instance.scheduledTime),
      'triggeredTime':
          const TimestampConverter().toJson(instance.triggeredTime),
      'relatedPredictionId': instance.relatedPredictionId,
    };
