import 'package:newwave_solution/model/parsing_detail_model.dart';

class ParsingModel {
  List<ParsingDetailModel>? placeName;
  List<ParsingDetailModel>? country;
  List<ParsingDetailModel>? state;
  List<ParsingDetailModel>? county;
  List<ParsingDetailModel>? city;
  List<ParsingDetailModel>? district;
  List<ParsingDetailModel>? subdistrict;
  List<ParsingDetailModel>? street;
  List<ParsingDetailModel>? block;
  List<ParsingDetailModel>? subblock;
  List<ParsingDetailModel>? houseNumber;
  List<ParsingDetailModel>? postalCode;
  List<ParsingDetailModel>? building;
  List<ParsingDetailModel>? secondaryUnits;
  List<ParsingDetailModel>? ontologyName;

  ParsingModel(
      {this.placeName,
      this.country,
      this.state,
      this.county,
      this.city,
      this.district,
      this.subdistrict,
      this.street,
      this.block,
      this.subblock,
      this.houseNumber,
      this.postalCode,
      this.building,
      this.secondaryUnits,
      this.ontologyName});

  factory ParsingModel.fromJson(Map<String, dynamic> json) {
    return ParsingModel(
      placeName: json["placeName"],
      country: json["country"],
      state: json["state"],
      county: json["county"],
      city: json["city"],
      district: json["district"],
      subdistrict: json["subdistrict"],
      street: json["street"],
      block: json["block"],
      subblock: json["subblock"],
      houseNumber: json["houseNumber"],
      postalCode: json["postalCode"],
      building: json["building"],
      secondaryUnits: json["secondaryUnits"],
      ontologyName: json["ontologyName"],
    );
  }
}
