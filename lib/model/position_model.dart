class PositionModel{
  double? lat;
  double? lng;

  PositionModel({this.lat, this.lng});

  factory PositionModel.fromJson(Map<String, dynamic> json){
    return PositionModel(
      lat: json["lat"],
      lng: json["lng"]
    );
  }
}