import 'dart:core';

/// {@category DataModel}
/// 블롭스토리지 이미지 데이터 모델
class BlobImage
{
  String url = '';

  BlobImage({
    required this.url
  });

  factory BlobImage.fromArray(String url)
  {
    return BlobImage(
        url: url
    );
  }

  factory BlobImage.fromJson(Map<String, dynamic> jsonData)
  {
    return BlobImage(
        url: jsonData['FilePath']
    );
  }
}