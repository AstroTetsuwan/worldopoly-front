import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.atomugames.worldopoly',
);

class WorldopolyMap extends StatelessWidget {

  final MapOptions mapOptions;
  final List<Widget> children;
  
  const WorldopolyMap({
    super.key,
    required this.mapOptions,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: mapOptions,
      children: [
        openStreetMapTileLayer,
        ...children
      ],
    );
  }
}