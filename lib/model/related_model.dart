import 'package:newwave_solution/model/access_model.dart';
import 'package:newwave_solution/model/position_model.dart';
import 'package:newwave_solution/model/related_address_model.dart';

class RelatedModel {
  String? relationship;
  String? title;
  String? id;
  String? resultType;
  String? houseNumberType;
  PositionModel? position;
  List<AccessModel>? access;
  RelatedAddressModel? address;

  RelatedModel({this.relationship, this.title, this.id, this.resultType, this.houseNumberType, this.position, this.access, this.address});

  factory RelatedModel.fromJson(Map<String, dynamic> json){
    return RelatedModel(
      relationship: json["relationship"],
      title: json["title"],
      id: json["id"],
      resultType: json["resultType"],
      houseNumberType: json["houseNumberType"],
      position: PositionModel.fromJson(json["position"]),
      access: (json["access"] as List).map((data) => AccessModel.fromJson(json["access"])).toList(),
      address: RelatedAddressModel.fromJson(json["address"])
    );
  }
}