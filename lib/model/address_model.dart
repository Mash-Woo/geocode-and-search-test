class AddressModel {
  String? label;
  String? countryCode;
  String? countryName;
  String? stateCode;
  String? state;
  String? countyCode;
  String? county;
  String? city;
  String? district;
  String? subdistrict;
  String? street;
  List<String>? streets;
  String? block;
  String? subblock;
  String? postalCode;
  String? houseNumber;
  String? building;
  String? unit;

  AddressModel(
      {this.label,
      this.countryCode,
      this.countryName,
      this.stateCode,
      this.state,
      this.countyCode,
      this.county,
      this.city,
      this.district,
      this.subdistrict,
      this.street,
      this.streets,
      this.block,
      this.subblock,
      this.postalCode,
      this.houseNumber,
      this.building,
      this.unit});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
        label: json["label"],
        countryCode: json["countryCode"],
        countryName: json["countryName"],
        stateCode: json["stateCode"],
        state: json["state"],
        countyCode: json["countyCode"],
        county: json["county"],
        city: json["city"],
        district: json["district"],
        subdistrict: json["subdistrict"],
        street: json["street"],
        streets:
            json.containsKey("streets") ? json["streets"].cast<String>() : null,
        block: json["block"],
        subblock: json["subblock"],
        postalCode: json["postalCode"],
        houseNumber: json["houseNumber"],
        building: json["building"],
        unit: json["unit"]);
  }
}
