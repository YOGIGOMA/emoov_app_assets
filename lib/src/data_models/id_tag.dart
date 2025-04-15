/// @{category DataModel}
/// 충전을 위한 식별 태그 데이터 모델
class IdTag {
  String tagSysId = '';
  String idTag = '';
  bool isUsed = false;
  String tagType = '';
  bool isBlocked = false;
  bool isDeleted = false;
  String regDate = '';

  IdTag({
    required this.tagSysId,
    required this.idTag,
    required this.tagType,
    required this.isUsed,
    required this.isBlocked,
    required this.isDeleted,
    required this.regDate,
  });

  factory IdTag.fromJson(Map<String, dynamic> jsonData) {

    final splits = (jsonData['createdDate'] as String).split('T');

    return IdTag(
      tagSysId: jsonData['tagId'],
      idTag: jsonData['idTag'],
      tagType: jsonData['tagType'],
      isUsed: jsonData['used'],
      isBlocked: jsonData['isBlocked'],
      isDeleted: jsonData['isDeleted'],
      regDate: splits[0].trim(),
    );
  }
}