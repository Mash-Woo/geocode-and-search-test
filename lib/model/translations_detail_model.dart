import 'package:newwave_solution/model/names_model.dart';

class TranslationDetailModel{
  List<NamesModel>? names;
  String? preference;

  TranslationDetailModel({this.names, this.preference});

  factory TranslationDetailModel.fromJson(Map<String, dynamic> json){
    return TranslationDetailModel(
      names: json["names"],
      preference: json["preference"]
    );
  }
}