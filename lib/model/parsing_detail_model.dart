class ParsingDetailModel{
  int? start;
  int? end;
  String? value;
  String? qq;

  ParsingDetailModel({this.start, this.end, this.value, this.qq});

  factory ParsingDetailModel.fromJson(Map<String,dynamic> json){
    return ParsingDetailModel(
      start: json["start"],
      end: json["end"],
      value: json["value"],
      qq: json["qq"]
    );
  }
}