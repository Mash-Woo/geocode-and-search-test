class PostalCodeDetailModel {
  String? postalCode;
  String? postalEntity;
  String? postalCodeType;
  String? zipClassificationCode;

  PostalCodeDetailModel({this.postalCode, this.postalEntity, this.postalCodeType, this.zipClassificationCode});

  factory PostalCodeDetailModel.fromJson(Map<String, dynamic> json){
    return PostalCodeDetailModel(
      postalCode: json["postalCode"],
      postalEntity: json["postalEntity"],
      postalCodeType: json["postalCodeType"],
      zipClassificationCode: json["zipClassificationCode"],
    );
  }
}