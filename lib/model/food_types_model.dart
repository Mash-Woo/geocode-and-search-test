class FoodTypesModel {
  String? id;
  String? name;
  bool? primary;

  FoodTypesModel({this.id, this.name, this.primary});

  factory FoodTypesModel.fromJson(Map<String, dynamic>json){
    return FoodTypesModel(
      id: json["id"],
      name: json["name"],
      primary: json["primary"]
    );
  }
}