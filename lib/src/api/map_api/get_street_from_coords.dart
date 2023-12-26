import "dart:convert" as convert;
import 'package:http/http.dart' as http;

import 'package:worldopoly/src/model/osm_street.dart';


Future<OsmStreet?> getStreetFromCoords ({
  required double lat, 
  required double long
}) async {
  http.Response response = await http.get(
    Uri.parse("https://nominatim.openstreetmap.org/reverse?lat=$lat&lon=$long&format=json&zoom=17&polygon_geojson=1")
  );
  if (response.statusCode == 200) {
    print(response.body);
    // TODO MAYBE use boundingbox":["48.7997276","48.8011651","2.4808537","2.4824697"],"geojson":{"type":"LineString","coordinates":[[2.4808537,48.8011651],[2.48121,48.8008154],[2.4817434,48.8003602],[2.481773,48.8003342],[2.4818781,48.8002418],[2.4824287,48.7997632],[2.4824697,48.7997276]] TO FILTER BETTER / AVOID GET STREET SHAPE CALL
    return OsmStreet.fromJson(
      convert.jsonDecode(response.body)
    );
  }
  return null;
}