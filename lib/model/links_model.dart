class LinksModel {
  String? linkId;
  String? cmId;
  String? sideOfLink;
  String? side;

  LinksModel({this.linkId, this.cmId, this.sideOfLink, this.side});

  factory LinksModel.fromJson(Map<String, dynamic> json){
    return LinksModel(
      linkId: json["linkId"],
      cmId: json["cmId"],
      sideOfLink: json["sideOfLink"],
      side: json["side"],
    );
  }
}