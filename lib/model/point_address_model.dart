class PointAddressModel {
  String? hmcId;

  PointAddressModel({this.hmcId});

  factory PointAddressModel.fromJson(Map<String, dynamic> json){
    return PointAddressModel(
      hmcId: json["hmcId"]
    );
  }
}