
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:worldopoly/src/api/api.dart';

import 'package:worldopoly/src/widgets/game/game_header.dart';
import 'package:worldopoly/src/widgets/game/map/map.dart';
import 'package:worldopoly/src/model/street.dart';
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
  Street? selectedStreet;

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

    try {
      Map<String, dynamic>? json = await WorldopolyAPI.get(
        path: "streets/from-coords",
        params: { "lat": point.latitude, "lng": point.longitude }
      );
      
      if (json == null) {
        return;
      }

      Street street = Street.fromJson(json);

      setState(() {
        selectedStreet = street;
        selectedStreetPoints = street.shape;
      });
      centerOnTap(point);

      // Adjust zoom to fit bounds of the selected street
      // TODO boundingbox here is just a part of the street, from the shape, get the real boundingbox
      // adjustZoomToFitBounds(street.boundingBox);

      _showStreetDetailsModal();
    } catch (e) {
      print(e);
    }
  }

  Future<void> adjustZoomToFitBounds (List<double> boundingBox) async {
    await _animatedMapController.animatedFitCamera(
      cameraFit: CameraFit.insideBounds(
        bounds: LatLngBounds(
          LatLng(boundingBox[0], boundingBox[2]), 
          LatLng(boundingBox[1], boundingBox[3])  
        )
      )
    );
  }

  void centerOnTap (LatLng point) => _animatedMapController.animateTo(
    dest: point,
    rotation: 0
  );

  // TODO https://api-ninjas.com/api/city to get city population

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WorldopolyMap(
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
          const GameHeader()
        ]
      )
    );
  }
}