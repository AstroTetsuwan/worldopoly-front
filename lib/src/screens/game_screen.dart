
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';

import 'package:worldopoly/src/api/map_api.dart';
import 'package:worldopoly/src/widgets/game/map/map.dart';
import 'package:worldopoly/src/model/osm_street.dart';
import 'package:worldopoly/src/widgets/game/map/street_line_layer.dart';
import 'package:worldopoly/src/widgets/game/modals/street_details_modal.dart';

const LatLng parisCoords = LatLng(48.864716, 2.349014);

class GameScreen extends StatefulWidget {

  const GameScreen({ super.key });

  @override
  State<GameScreen> createState() => _GameScreenState();
}


class _GameScreenState extends State<GameScreen> with TickerProviderStateMixin {
  late final AnimatedMapController _animatedMapController = AnimatedMapController(vsync: this);

  double zoom = 10;
  LatLng? lastTapPosition;
  List<List<LatLng>> selectedStreetPoints = [];
  OsmStreet? selectedStreet;

  void onCloseStreetDetailsModal() {
    setState(() {
      selectedStreet = null;
      selectedStreetPoints = [];
    });
  }

  void _showStreetDetailsModal() {
      showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) => StreetDetailsModal(
          street: selectedStreet
        )
      )
      .whenComplete(onCloseStreetDetailsModal);
  }
  
  void onTapMap(TapPosition tapPosition, LatLng point) async {
    setState(() {
      lastTapPosition = point;
      zoom = _animatedMapController.mapController.camera.zoom;
    });

    OsmStreet? street = await getStreetFromCoords(
      lat: point.latitude, 
      long: point.longitude
    );

    if (street != null) {
      List<List<LatLng>> points = await getOsmStreetShape(street: street);

      setState(() {
        selectedStreet = street;
        selectedStreetPoints = points;
      });
      
      // TODO: FIND A WAY TO ADJUST THE ZOOM TO THE LENGTH OF THE STREET
      centerOnTap(point);

      _showStreetDetailsModal();
    }
  }

  void centerOnTap (LatLng point) => _animatedMapController.animateTo(
    dest: point,
    rotation: 0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WorldopolyMap(
        mapController: _animatedMapController.mapController,
        mapOptions: MapOptions(
          initialCenter: parisCoords,
          initialZoom: zoom,
          onTap: onTapMap,
        ), 
        children: [
          StreetLineLayer(
            points: selectedStreetPoints, 
            color: Colors.red, 
            width: 4.0
          )
        ]
      ),
    );
  }
}