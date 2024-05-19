class NamesModel{
  String? value;
  String? language;
  String? type;
  bool? primary;
  bool? transliterated;

  NamesModel({this.value, this.language, this.type, this.primary, this.transliterated});

  factory NamesModel.fromJson(Map<String, dynamic> json){
    return NamesModel(
      value: json["value"],
      language: json["language"],
      type: json["type"],
      primary: json["primary"],
      transliterated: json["transliterated"]
    );
  }
}