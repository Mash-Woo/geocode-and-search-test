import 'package:newwave_solution/model/translations_detail_model.dart';

class TranslationsModel{
  List<TranslationDetailModel>? stateNames;
  List<TranslationDetailModel>? countyNames;
  List<TranslationDetailModel>? cityNames;
  List<TranslationDetailModel>? districtNames;

  TranslationsModel({this.stateNames, this.countyNames, this.cityNames, this.districtNames});

  factory TranslationsModel.fromJson(Map<String, dynamic> json){
    return TranslationsModel(
      stateNames: (json["stateNames"] as List).map((data) => TranslationDetailModel.fromJson(data)).toList(),
      countyNames: (json["countyNames"] as List).map((data) => TranslationDetailModel.fromJson(data)).toList(),
      cityNames: (json["cityNames"] as List).map((data) => TranslationDetailModel.fromJson(data)).toList(),
      districtNames: (json["districtNames"] as List).map((data) => TranslationDetailModel.fromJson(data)).toList()
    );
  }
}