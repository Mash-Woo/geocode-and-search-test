class TimezoneModel {
  String? name;
  String? utcOffSet;

  TimezoneModel({this.name, this.utcOffSet});

  factory TimezoneModel.fromJson(Map<String, dynamic> json){
    return TimezoneModel(
      name: json["name"],
      utcOffSet: json["utcOffset"],
    );
  }
}