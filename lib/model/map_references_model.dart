import 'package:newwave_solution/model/links_model.dart';
import 'package:newwave_solution/model/point_address_model.dart';
import 'package:newwave_solution/model/segments_model.dart';

class MapReferencesModel {
  List<LinksModel>? links;
  PointAddressModel? pointAddress;
  List<SegmentsModel>? segments;

  MapReferencesModel({this.links, this.pointAddress, this.segments});

  factory MapReferencesModel.fromJson(Map<String, dynamic> json){
    return MapReferencesModel(
      links: (json["links"] as List).map((data) => LinksModel.fromJson(json["links"])).toList(),
      pointAddress: PointAddressModel.fromJson(json["pointAddress"]),
      segments: (json["segments"] as List).map((data) => SegmentsModel.fromJson(json["segments"])).toList()
    );
  }
}