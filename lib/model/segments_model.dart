class SegmentsModel{
  String? ref;
  String? side;

  SegmentsModel({this.ref, this.side});

  factory SegmentsModel.fromJson(Map<String, dynamic> json){
    return SegmentsModel(
      ref: json["ref"],
      side: json["side"],
    );
  }
}