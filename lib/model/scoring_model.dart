import 'package:newwave_solution/model/field_score_model.dart';

class ScoringModel{
  double? queryScore;

  FieldScoreModel? fieldScore;

  ScoringModel({this.queryScore, this.fieldScore});

  factory ScoringModel.fromJson(Map<String, dynamic> json){
    return ScoringModel(
      queryScore: json["queryScore"],
      fieldScore: FieldScoreModel.fromJson(json["fieldScore"])
    );
  }
}