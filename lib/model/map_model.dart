import 'package:newwave_solution/model/items_model.dart';

class MapModel {
  final List<ItemsModel> items;

  MapModel({required this.items});

  factory MapModel.fromJson(Map<String, dynamic> json){
    return MapModel(items: json.containsKey("items") ? (json["items"] as List).map((data) => ItemsModel.fromJson(data)).toList() : []);
  }
}