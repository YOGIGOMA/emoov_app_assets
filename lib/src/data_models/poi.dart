/// @{category DataModel}
/// 관심지점 데이터모델
class Poi {
  String name = "";
  String address = "";
  double lat = 0.0;
  double lng = 0.0;

  Poi({
    required this.name,
    required this.address,
    required this.lat,
    required this.lng,
  });

  factory Poi.fromJson(Map<String, dynamic> jsonData)
  {
    var address = "";

    if(jsonData["roadname"] != "") {
      address = "${jsonData["roadname"]} ${jsonData["roadjibun"]}";
    }
    else {
      address = "${jsonData["address"]} ${jsonData["jibun"]}";
    }
    return Poi(
        name: jsonData["name1"],
        address: address,
        lat: double.parse(jsonData["dpy"]),
        lng: double.parse(jsonData["dpx"])
    );
  }
}