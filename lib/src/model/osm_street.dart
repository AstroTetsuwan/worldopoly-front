

import 'package:worldopoly/src/model/osm_address.dart';

class OsmStreet {
  final int osmId;
  final String name;
  final String displayName;
  final OsmAddress address;
  final List<double> boundingBox;

  OsmStreet({
    required this.osmId,
    required this.name,
    required this.displayName,
    required this.address,
    required this.boundingBox
  });

  factory OsmStreet.fromJson(Map<String, dynamic> json) {
    // TODO FILTER TYPE STREET
    // eg => Rue Vauvillier 75001 type "unclassified" (should be accepted), 
    // type "residential" OK
    return OsmStreet(
      osmId: json.containsKey("osm_id") ? json['osm_id'] : 0,
      name: json.containsKey("name") ? json['name'] : "",
      displayName: json.containsKey("display_name") ? json['display_name'] : "",
      address: json.containsKey("address") 
               ? OsmAddress.fromJson(json['address']) 
               : OsmAddress.getEmptyAddress(),
      boundingBox: json.containsKey("boundingbox") ? json['boundingbox'].map<double>((e) => double.parse(e)).toList() : []
    );
  }

  @override
  String toString() {
    return 'OsmStreet{placeId: $osmId, name: $name, displayName: $displayName, address: $address, boundingBox: $boundingBox}';
  }
}