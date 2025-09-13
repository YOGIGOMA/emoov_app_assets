
import 'dart:core';

/// @{category DataModel}
/// 공지사항 데이터모델
class Notice
{
  int postId = 0;
  String title = '';
  String contents = '';
  int viewCount = 0;
  bool isPinned = false;
  int pinOrder = 0;
  bool isPopup = false;
  String popupStartDate = '';
  String popupEndDate = '';
  String postType = '';
  String createdDate = '';
  Map<String, String>? imageInfos;

  Notice({
    required this.postId,
    required this.title,
    required this.contents,
    required this.viewCount,
    required this.isPinned,
    required this.pinOrder,
    required this.isPopup,
    required this.popupStartDate,
    required this.popupEndDate,
    required this.postType,
    required this.createdDate,
    required this.imageInfos
  });

  factory Notice.fromJson(Map<String, dynamic> jsonData)
  {
    return Notice(
        postId: jsonData['PostId'],
        title: jsonData['Title'],
        contents: jsonData['Contents'],
        viewCount: jsonData['ViewCount'],
        isPinned: jsonData['IsPinned'],
        pinOrder: jsonData['PinOrder'],
        isPopup: jsonData['IsPopup'],
        popupStartDate: jsonData['PopupStartDate'],
        popupEndDate: jsonData['PopupEndDate'],
        postType: jsonData['PostType'],
        createdDate: jsonData['CreatedDate'],
        imageInfos: jsonData['ImageInfos'] != null ? Map<String, String>.from(jsonData['ImageInfos']) : {}
    );
  }

}