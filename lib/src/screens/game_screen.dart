
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'package:worldopoly/src/api/map_api.dart';
import 'package:worldopoly/src/widgets/game/map/map.dart';
import 'package:worldopoly/src/model/osm_street.dart';

const LatLng parisCoords = LatLng(48.864716, 2.349014);

class GameScreen extends StatefulWidget {

  const GameScreen({ super.key });

  @override
  State<GameScreen> createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> {
  List<List<LatLng>> selectedStreetPoints = [];
  
  void onTapMap(TapPosition tapPosition, LatLng point) async {
    OsmStreet? street = await getStreetFromCoords(
      lat: point.latitude, 
      long: point.longitude
    );
    if (street != null) {
      List<List<LatLng>> points = await getOsmStreetShape(street: street);
      setState(() => selectedStreetPoints = points);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldopolyMap(
        mapOptions: MapOptions(
          initialCenter: parisCoords,
          initialZoom: 10,
          onTap: onTapMap,
        ), 
        children: [
          PolylineLayer(
            polylines: selectedStreetPoints.map((points) => Polyline(
              points: points,
              strokeWidth: 4.0,
              color: Colors.red,
            )).toList()
          )
        ]
      ),
    );
  }
}