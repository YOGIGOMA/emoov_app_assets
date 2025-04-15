import 'dart:core';

/// @{category DataModel}
/// 푸쉬알람 데이터모델
class PushAlarm {
  String alarmSysId = '';
  String title = '';
  String content = '';
  String payload = '';
  int groupId = 0;
  String type = '';
  int read = 0;
  String createdDate = '';

  PushAlarm({
    required this.alarmSysId,
    required this.title,
    required this.content,
    required this.payload,
    required this.groupId,
    required this.type,
    required this.read,
    required this.createdDate,
  });
}