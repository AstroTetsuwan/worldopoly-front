

import 'package:flutter/material.dart';
import 'package:worldopoly/src/constants/theme.dart';


class ModalDecoration extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final double height;
  
  const ModalDecoration({
    super.key,
    required this.child,
    this.backgroundImage,
    this.height = 200
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10), 
          topRight: Radius.circular(10)
        ),
        color: WorldopolyColor.primary,
        image: backgroundImage != null 
          ? DecorationImage(
            image: AssetImage(backgroundImage!),
            fit: BoxFit.cover,
            alignment: AlignmentDirectional.bottomCenter
          ) 
          : null
      ),
      child: child
    );
  }
}

class WorldopolyBottomModal extends StatelessWidget {
  final List<Widget> children;
  final String? backgroundImage;
  
  const WorldopolyBottomModal({
    super.key,
    required this.children,
    this.backgroundImage
  });

  @override
  Widget build(BuildContext context) {
    return ModalDecoration(
      height: 200,
      backgroundImage: backgroundImage,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}