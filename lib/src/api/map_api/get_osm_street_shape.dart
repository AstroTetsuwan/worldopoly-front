import "dart:convert" as convert;
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:worldopoly/src/model/osm_street.dart';

Future<List<List<LatLng>>> getOsmStreetShape ({
  required OsmStreet street
}) async {
  String filters = "street=${street.name}&city=${street.address.city}&country=${street.address.country}";
  String options = "format=geocodejson&polygon_geojson=1&dedupe=0&limit=1000&addressdetails=1";
  
  http.Response response = await http.get(
    Uri.parse("https://nominatim.openstreetmap.org/search?$filters&$options")
  );
  // print(response.body);
  List<List<LatLng>> points = [];
  
  try {
    Map<String, dynamic> json = convert.jsonDecode(response.body);
    List<dynamic> features = json['features'];
    for (var feature in features) {
      Map<String, dynamic> geocoding = feature['properties']['geocoding'];
      bool isStreet = geocoding['type'] == 'street';
      bool isTheRightStreet = 
        geocoding['city'] == street.address.city || 
        geocoding['postcode'] == street.address.postcode;

      if (!isStreet || !isTheRightStreet) {
        // print("type: ${geocoding['type']}, city: ${geocoding['city']}");
      }

      Map<String, dynamic> geometry = feature['geometry'];
      if (geometry['type'] == 'LineString') {
        List<dynamic> coordinates = geometry['coordinates'];
        points.add(coordinates.map((coordinate) => LatLng(coordinate[1], coordinate[0])).toList());
      }
    }
    return points;
  } catch (e) {
    return [];
  }
}
