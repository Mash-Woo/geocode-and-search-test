class MapViewModel {
  double? west;
  double? south;
  double? east;
  double? north;

  MapViewModel({this.west, this.south, this.east, this.north});

  factory MapViewModel.fromJson(Map<String, dynamic> json){
    return MapViewModel(
      west: json["west"],
      south: json["south"],
      east: json["east"],
      north: json["north"]
    );
  }
}
