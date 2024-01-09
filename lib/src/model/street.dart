
import 'package:latlong2/latlong.dart';
import 'package:worldopoly/src/model/city.dart';

class Street {
  final List<double> boundingBox;
  final String road;
  final String suburb;
  final String cityDistrict;
  final City city;
  final String postcode;
  final List<List<LatLng>> shape;

  Street({
    required this.boundingBox,
    required this.road,
    required this.suburb,
    required this.cityDistrict,
    required this.city,
    required this.postcode,
    required this.shape
  });

  factory Street.fromJson(Map<String, dynamic> json) {
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

    City city = City.fromJson(json['city']);

    return Street(
      boundingBox: boundingBox,
      road: json.containsKey("road") ? json['road'] : "",
      suburb: json.containsKey("suburb") ? json['suburb'] : "",
      cityDistrict: json.containsKey("city_district") ? json['city_district'] : "",
      city: city,
      postcode: json.containsKey("postcode") ? json['postcode'] : "",
      shape: shape
    );
  }

  @override
  String toString() {
    return 'Street{road: $road, city: $city, boundingBox: $boundingBox}';
  }
}