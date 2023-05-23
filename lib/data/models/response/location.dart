class Location {
  List<LocationData>? locationData;

  Location({this.locationData});

  Location.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      locationData = <LocationData>[];
      json['results'].forEach((v) {
        locationData!.add(LocationData.fromJson(v));
      });
    }
  }


}

class LocationData {
  int? id;
  String? name;
  double? latitude;
  double? longitude;

  LocationData({this.id, this.name, this.latitude, this.longitude});

  LocationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}
