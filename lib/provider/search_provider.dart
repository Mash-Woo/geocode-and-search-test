import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:newwave_solution/utils/api_key.dart';
import 'package:newwave_solution/model/items_model.dart';
import 'package:newwave_solution/model/map_model.dart';
import 'package:newwave_solution/utils/debouncer.dart';
import 'package:newwave_solution/utils/network_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchProvider extends ChangeNotifier {
  final _debouncer = Debouncer(milliseconds: 1000);
  String searchText = '';
  bool isDeletedSearch = false;
  double userLat = 0;
  double userLng = 0;
  String userCountryCode = '';
  MapModel locationSuggest = MapModel(items: []);

  // Get user country code
  Future<String> fetchReverseGeocodeDataCurrentUser() async {
    final url =
        'https://geocode.search.hereapi.com/v1/revgeocode?at=$userLat,$userLng&apiKey=${API.key}';
    log('User Lat in Rev $userLat');
    final response = await NetWorkService.get(url);
    log('Response ReverseGeocode Status ${response.statusCode} ${response.body}');
    if (response.statusCode == 200) {
      userCountryCode = MapModel.fromJson(jsonDecode((response.body)))
          .items[0]
          .address!
          .countryCode!;
      return userCountryCode;
    } else {
      return '';
    }
  }

  // Suggest locations
  Future<MapModel> autosuggestData(String input) async {
    final countryCode = await fetchReverseGeocodeDataCurrentUser();
    final url =
        'https://geocode.search.hereapi.com/v1/autosuggest?q=$input&at=$userLat,$userLng&in=countryCode:$countryCode&apiKey=${API.key}';
    final response = await NetWorkService.get(url);
    log('Response Status ${response.statusCode} ${response.body}');
    if (response.statusCode == 200) {
      return MapModel.fromJson(jsonDecode((response.body)));
    } else {
      return MapModel(items: []);
    }
  }

  // Select location and open GoogleMap
  Future<void> selectedLocation(String id) async {
    double latitude;
    double longitude = 0;
    final url =
        'https://geocode.search.hereapi.com/v1/lookup?id=$id&apiKey=${API.key}';
    final response = await NetWorkService.get(url);
    log('Url : $url');
    log('Response Selected Location Status ${response.statusCode} ${response.body}');
    if (response.statusCode == 200) {
      latitude =
          ItemsModel.fromJson(jsonDecode((response.body))).position!.lat!;
      longitude =
          ItemsModel.fromJson(jsonDecode((response.body))).position!.lng!;
      openMap(latitude, longitude);
    } else {
      throw const FormatException(
          'Failed to select location and open Google Map');
    }
    notifyListeners();
  }

  // Open GoogleMap
  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/dir/?api=1&origin=$userLat,$userLng&destination=$latitude,$longitude&travelmode=driving&dir_action=navigate';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
    notifyListeners();
  }

  // Search locations
  Future<void> searchLocations(String text) async {
    searchText = text.toLowerCase();
    log('Search Text $searchText');
    _debouncer.run(() async {
      await determinePosition();
      await determineUserLocation();
      notifyListeners();
      locationSuggest = await autosuggestData(text);
      log('Location Suggest ${locationSuggest.items.length}');
      notifyListeners();
    });
  }

  // Delete search
  Future<void> deleteSearch() async {}

  // Check user's location permission
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  // Get user's location
  Future<void> determineUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userLat = position.latitude;
    userLng = position.longitude;
    log('User Position ${position.latitude} ${position.longitude}');
    fetchReverseGeocodeDataCurrentUser();
    notifyListeners();
  }
}
