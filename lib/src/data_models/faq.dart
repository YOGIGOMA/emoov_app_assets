import 'dart:core';

/// @{category DataModel}
/// 자주묻는질문 데이터모델
class Faq
{
  int postId = 0;
  String title = '';
  String contents = '';
  String category = '';

  Faq({
    required this.postId,
    required this.title,
    required this.contents,
    required this.category,
  });

  factory Faq.fromJson(Map<String, dynamic> jsonData)
  {
    return Faq(
      postId: jsonData['FaqPostId'],
      title: jsonData['Title'],
      contents: jsonData['Contents'],
      category: jsonData['Category'],
    );
  }
}