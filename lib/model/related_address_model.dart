class RelatedAddressModel{
  String? label;
  String? unit;

  RelatedAddressModel({this.label, this.unit});

  factory RelatedAddressModel.fromJson(Map<String, dynamic> json){
    return RelatedAddressModel(
      label: json["label"],
      unit: json["unit"]
    );
  }
}