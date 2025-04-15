import 'dart:core';

/// @{category DataModel}
/// 1:1 문의 데이터 모델
class Enquiry
{
  int postId = 0;
  String contents = '';
  String category = '';
  String postDate = '';
  String callbackEmail = '';
  String callbackDate = '';
  String callbackContents = '';

  Enquiry({
    required this.postId,
    required this.contents,
    required this.category,
    required this.postDate,
    required this.callbackEmail,
    required this.callbackDate,
    required this.callbackContents,

  });

  factory Enquiry.fromJson(Map<String, dynamic> jsonData)
  {
    String callbackDate = '';
    String callbackContents = '';
    if(jsonData['CallbackDate'] != null) {
      callbackDate = jsonData['CallbackDate'];
    }
    if(jsonData['CallbackContents'] != null) {
      callbackContents = jsonData['CallbackContents'];
    }
    return Enquiry(
      postId: jsonData['EnquiryPostId'],
      category: jsonData['Category'],
      contents: jsonData['Contents'],
      callbackEmail: jsonData['CallbackEmail'],
      postDate: jsonData['PostDate'],
      callbackDate: callbackDate,
      callbackContents: callbackContents,
    );
  }
}