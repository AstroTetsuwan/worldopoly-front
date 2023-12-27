import 'package:flutter/material.dart';
import 'package:worldopoly/src/constants/theme.dart';

List<NavigationDestination> screensTabItem = const [
  NavigationDestination(
    selectedIcon: Icon(Icons.apartment, color: WorldopolyColor.shade3),
    icon: Icon(Icons.apartment, color: WorldopolyColor.shade4),
    label: 'Map',
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.map, color: WorldopolyColor.shade3),
    icon: Icon(Icons.map, color: WorldopolyColor.shade4),
    label: 'Map',
  ),
  NavigationDestination(
    selectedIcon: Icon(Icons.settings, color: WorldopolyColor.shade3),
    icon: Icon(Icons.settings, color: WorldopolyColor.shade4),
    label: 'Settings',
  ),
]; 

class BottomNavBar extends StatelessWidget  {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: screensTabItem,
      selectedIndex: selectedIndex,
      onDestinationSelected: onTap,
      backgroundColor: WorldopolyColor.primary,
      indicatorColor: WorldopolyColor.shade1,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 50,
    );
  }
}