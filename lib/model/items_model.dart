import 'package:newwave_solution/model/access_model.dart';
import 'package:newwave_solution/model/address_model.dart';
import 'package:newwave_solution/model/categories_model.dart';
import 'package:newwave_solution/model/country_info_model.dart';
import 'package:newwave_solution/model/food_types_model.dart';
import 'package:newwave_solution/model/map_references_model.dart';
import 'package:newwave_solution/model/map_view_model.dart';
import 'package:newwave_solution/model/parsing_model.dart';
import 'package:newwave_solution/model/position_model.dart';
import 'package:newwave_solution/model/postal_code_detail_model.dart';
import 'package:newwave_solution/model/related_model.dart';
import 'package:newwave_solution/model/scoring_model.dart';
import 'package:newwave_solution/model/street_info_model.dart';
import 'package:newwave_solution/model/timezone_model.dart';
import 'package:newwave_solution/model/translations_model.dart';

class ItemsModel {
  String? title;
  String? id;
  String? politicalView;
  String? resultType;
  String? houseNumberType;
  String? addressBlockType;
  String? localityType;
  String? administrativeAreaType;
  AddressModel? address;
  List<PostalCodeDetailModel>? postalCodeDetails;
  PositionModel? position;
  List<AccessModel>? access;
  int? distance;
  MapViewModel? mapView;
  List<CategoriesModel>? categories;
  List<FoodTypesModel>? foodTypes;
  bool? houseNumberFallback;
  bool? estimatedPointAddress;
  TimezoneModel? timeZone;
  ScoringModel? scoring;
  ParsingModel? parsing;
  List<StreetInfoModel>? streetInfo;
  CountryInfoModel? countryInfo;
  TranslationsModel? translations;
  MapReferencesModel? mapReferences;
  List<RelatedModel>? related;

  ItemsModel(
      {this.title,
      this.id,
      this.politicalView,
      this.resultType,
      this.houseNumberType,
      this.addressBlockType,
      this.localityType,
      this.administrativeAreaType,
      this.address,
      this.postalCodeDetails,
      this.position,
      this.access,
      this.distance,
      this.mapView,
      this.categories,
      this.foodTypes,
      this.houseNumberFallback,
      this.estimatedPointAddress,
      this.timeZone,
      this.scoring,
      this.parsing,
      this.streetInfo,
      this.countryInfo,
      this.translations,
      this.mapReferences,
      this.related});

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
        title: json["title"],
        id: json["id"],
        politicalView: json["politicalView"],
        resultType: json["resultType"],
        houseNumberType: json["houseNumberType"],
        addressBlockType: json["addressBlockType"],
        localityType: json["localityType"],
        administrativeAreaType: json["administrativeAreaType"],
        address: (json["address"] != null) ? AddressModel.fromJson(json["address"]) : null,
        postalCodeDetails: (json.containsKey("postalCodeDetails"))
            ? (json["postalCodeDetails"] as List)
                .map((data) =>
                    PostalCodeDetailModel.fromJson(json["postalCodeDetails"]))
                .toList()
            : [],
        position: (json["position"] != null) ? PositionModel.fromJson(json["position"]) : null,
        access: (json['access'] != null) ? (json['access'] as List<dynamic>)
            .map((data) => AccessModel.fromJson(data as Map<String, dynamic>))
            .toList() : [],
        distance: json["distance"],
        mapView: (json["mapView"] != null) ? MapViewModel.fromJson(json["mapView"]) : null,
        categories: json["categories"] != null
          ? (json["categories"] as List)
              .map((data) => CategoriesModel.fromJson(data as Map<String, dynamic>))
              .toList()
          : null,
        foodTypes: (json.containsKey("foodTypes"))
            ? (json["foodTypes"] as List)
                .map((data) => FoodTypesModel.fromJson(data as Map<String, dynamic>))
                .toList()
            : [],
        houseNumberFallback: json["houseNumberFallback"],
        estimatedPointAddress: json["estimatedPointAddress"],
        timeZone: (json["timeZone"] != null)
            ? TimezoneModel.fromJson(json["timeZone"])
            : null,
        scoring: (json["scoring"] != null) ? ScoringModel.fromJson(json["scoring"]) : null,
        parsing: (json["parsing"] != null)
            ? ParsingModel.fromJson(json["parsing"])
            : null,
        streetInfo: (json["streetInfo"] != null)
            ? (json["streetInfo"] as List)
                .map((data) => StreetInfoModel.fromJson(json["streetInfo"]))
                .toList()
            : [],
        countryInfo: (json["countryInfo"] != null)
            ? CountryInfoModel.fromJson(json["countryInfo"])
            : null,
        translations: (json["translations"] != null)
            ? TranslationsModel.fromJson(json["translations"])
            : null,
        mapReferences: (json["mapReferences"] != null)
            ? MapReferencesModel.fromJson(json["mapReferences"])
            : null,
        related: (json["related"] != null)
            ? (json["related"] as List)
                .map((data) => RelatedModel.fromJson(json["related"]))
                .toList()
            : []);
  }
}
