
import 'package:latlong2/latlong.dart';

class OsmStreet {
  final int osmId;
  final List<double> boundingBox;
  final String road;
  final String suburb;
  final String cityDistrict;
  final String city;
  final String state;
  final String region;
  final String postcode;
  final String country;
  final String countryCode;
  final List<List<LatLng>> shape;

  OsmStreet({
    required this.osmId,
    required this.boundingBox,
    required this.road,
    required this.suburb,
    required this.cityDistrict,
    required this.city,
    required this.state,
    required this.region,
    required this.postcode,
    required this.country,
    required this.countryCode,
    required this.shape
  });

  factory OsmStreet.fromJson(Map<String, dynamic> json) {
    // TODO VALIDATE STREET return null if wrong ?

    // TODO FILTER TYPE STREET
    // eg => Rue Vauvillier 75001 type "unclassified" (should be accepted), 
    // type "residential" OK

    List<List<LatLng>> shape = [];
    if (json.containsKey("shape") && (json['shape'] as List).isNotEmpty) {
      for (dynamic shapePart in json['shape']) {
        List<LatLng> shapePartLatLng = [];
        for (dynamic shapePartLatLngJson in shapePart) {
          shapePartLatLng.add(LatLng(
            double.parse(shapePartLatLngJson['lat'].toString()),
            double.parse(shapePartLatLngJson['lng'].toString())
          ));
        }
        shape.add(shapePartLatLng);
      }
    }

    List<double> boundingBox = [];
    if (json.containsKey("boundingBox") && (json['boundingBox'] as List).isNotEmpty) {
      for (dynamic boundingBoxPart in json['boundingBox']) {
        boundingBox.add(double.parse(boundingBoxPart.toString()));
      }
    }

    return OsmStreet(
      osmId: json.containsKey("osm_id") ? json['osm_id'] : 0,
      boundingBox: boundingBox,
      road: json.containsKey("road") ? json['road'] : "",
      suburb: json.containsKey("suburb") ? json['suburb'] : "",
      cityDistrict: json.containsKey("city_district") ? json['city_district'] : "",
      city: json.containsKey("city") ? json['city'] : "",
      state: json.containsKey("state") ? json['state'] : "",
      region: json.containsKey("region") ? json['region'] : "",
      postcode: json.containsKey("postcode") ? json['postcode'] : "",
      country: json.containsKey("country") ? json['country'] : "",
      countryCode: json.containsKey("country_code") ? json['country_code'] : "",
      shape: shape
    );
  }

  @override
  String toString() {
    return 'OsmStreet{placeId: $osmId, road: $road, city: $city, boundingBox: $boundingBox}';
  }
}