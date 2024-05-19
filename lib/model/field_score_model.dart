class FieldScoreModel {
  double? country;
  double? countryCode;
  double? state;
  double? stateCode;
  double? county;
  double? countyCode;
  double? city;
  double? district;
  double? subDistrict;
  List<dynamic>? streets;
  double? block;
  double? subblock;
  double? houseNumber;
  double? postalCode;
  double? building;
  double? unit;
  double? placeName;
  double? ontologyName;

  FieldScoreModel(
      {this.country,
      this.countryCode,
      this.state,
      this.stateCode,
      this.county,
      this.countyCode,
      this.city,
      this.district,
      this.subDistrict,
      this.streets,
      this.block,
      this.subblock,
      this.houseNumber,
      this.postalCode,
      this.building,
      this.unit,
      this.placeName,
      this.ontologyName});
  
  factory FieldScoreModel.fromJson(Map<String,dynamic> json){
    return FieldScoreModel(
      country: json["country"],
      countryCode: json["countryCode"],
      state: json["state"],
      stateCode: json["stateCode"],
      county: json["county"],
      countyCode: json["countyCode"],
      city: json["city"],
      district: json["district"],
      subDistrict: json["subdistrict"],
      streets: json["streets"],
      block: json["block"],
      subblock: json["subblock"],
      houseNumber: json["houseNumber"],
      postalCode: json["postalCode"],
      building: json["building"],
      unit: json["unit"],
      placeName: json["placeName"],
      ontologyName: json["ontologyName"]
    );
  }
}
