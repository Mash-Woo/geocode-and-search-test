class CategoriesModel{
  String? id;
  String? name;
  bool? primary;

  CategoriesModel({this.id, this.name, this.primary});

  factory CategoriesModel.fromJson(Map<String,dynamic> json){
    return CategoriesModel(
      id: json["id"],
      name: json["name"],
      primary: json["primary"]
    );
  }
}