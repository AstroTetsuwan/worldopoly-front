

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class StreetLineLayer extends StatelessWidget {
  final List<List<LatLng>> points;
  final Color color;
  final double width;
  
  const StreetLineLayer({
    super.key,
    required this.points,
    required this.color,
    required this.width
  });

  @override
  Widget build(BuildContext context) {
    return PolylineLayer(
      polylines: points.map((List<LatLng> points) => Polyline(
        points: points,
        strokeWidth: width,
        color: color
      )).toList()
    );
  }
}