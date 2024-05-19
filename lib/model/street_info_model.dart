class StreetInfoModel {
  String? baseName;
  String? streetType;
  bool? streetTypePrecedes;
  bool? streetTypeAttached;
  String? prefix;
  String? suffix;
  String? direction;
  String? language;

  StreetInfoModel(
      {this.baseName,
      this.streetType,
      this.streetTypePrecedes,
      this.streetTypeAttached,
      this.prefix,
      this.suffix,
      this.direction,
      this.language});

  factory StreetInfoModel.fromJson(Map<String, dynamic> json){
    return StreetInfoModel(
      baseName: json["baseName"],
      streetType: json["streetType"],
      streetTypePrecedes: json["streetTypePrecedes"],
      streetTypeAttached: json["streetTypeAttached"],
      prefix: json["prefix"],
      suffix: json["suffix"],
      direction: json["direction"],
      language: json["language"]
    );
  }
}
