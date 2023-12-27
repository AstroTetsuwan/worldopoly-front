import 'package:flutter/material.dart';
import 'package:worldopoly/src/constants/theme.dart';
import 'package:worldopoly/src/constants/worldopoly_assets.dart';

class GameHeaderLogo extends StatelessWidget {
  final double size = 30;
  const GameHeaderLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage(WorldopolyAssets.logoSmall),
      height: size,
      width: size,
      fit: BoxFit.contain
    );
  }
}

class GameHeader extends StatelessWidget {
  const GameHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: WorldopolyColor.primary),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GameHeaderLogo(),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}