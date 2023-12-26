

import 'package:flutter/material.dart';
import 'package:worldopoly/src/model/osm_street.dart';

class StreetDetailsModal extends StatelessWidget {
  final OsmStreet? street;
  const StreetDetailsModal({
    super.key,
    required this.street
  });

  @override
  Widget build(BuildContext context) {
    return Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), 
                topRight: Radius.circular(10)
              ),
              color: Theme.of(context).primaryColorLight
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(street?.name ?? 'Street not found'),
                  ElevatedButton(
                    child: const Text('Close BottomSheet'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
          );
  }
}