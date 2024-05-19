class AccessModel {
  double? lat;
  double? lng;

  AccessModel({this.lat, this.lng});

  factory AccessModel.fromJson(Map<String, dynamic> json){
    return AccessModel(
      lat: json["lat"],
      lng: json["lng"]
    );
  }
}