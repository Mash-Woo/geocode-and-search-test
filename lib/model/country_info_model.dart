class CountryInfoModel {
  String? alpha2;
  String? alpha3;

  CountryInfoModel({this.alpha2, this.alpha3});

  factory CountryInfoModel.fromJson(Map<String, dynamic> json){
    return CountryInfoModel(
      alpha2: json["alpha2"],
      alpha3: json["alpha3"]
    );
  }
}