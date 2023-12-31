

import 'package:flutter/material.dart';
import 'package:worldopoly/src/model/osm_street.dart';
import 'package:worldopoly/src/widgets/game/modals/worldopoly_bottom_modal.dart';


class StreetDetailsModal extends StatelessWidget {
  final OsmStreet? street;
  
  const StreetDetailsModal({
    super.key,
    required this.street
  });

  @override
  Widget build(BuildContext context) {
    return WorldopolyBottomModal(
      backgroundImage: 'assets/images/colored-street.jpg',
      children: <Widget>[
        Text(street?.road ?? 'Street not found', style: const TextStyle(color: Colors.white)),
        ElevatedButton(
          child: const Text('Close BottomSheet'),
          onPressed: () => Navigator.pop(context),
        ),
      ]
    );
  }
}