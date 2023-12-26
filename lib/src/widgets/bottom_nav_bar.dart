import 'package:flutter/material.dart';

const screensTabItem = <NavigationDestination>[
  NavigationDestination(
    icon: Icon(Icons.apartment, color: Color.fromRGBO(171, 169, 176, 1)),
    selectedIcon: Icon(Icons.apartment),
    label: 'Map',
  ),
  NavigationDestination(
    icon: Icon(Icons.map, color: Color.fromRGBO(171, 169, 176, 1)),
    selectedIcon: Icon(Icons.map),
    label: 'Map',
  ),
  NavigationDestination(
    icon: Icon(Icons.settings, color: Color.fromRGBO(171, 169, 176, 1)),
    selectedIcon: Icon(Icons.settings),
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
      backgroundColor: Theme.of(context).primaryColor,
      indicatorColor: Theme.of(context).secondaryHeaderColor,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      height: 50,
    );
  }
}