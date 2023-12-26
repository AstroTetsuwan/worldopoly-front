
import 'package:flutter/material.dart';

import 'package:worldopoly/src/constants/theme.dart';
import 'package:worldopoly/src/screens/game_screen.dart';
import 'package:worldopoly/src/widgets/bottom_nav_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 1;

  List<Widget> screens = <Widget>[
    const Text('My Streets'),
    const GameScreen(),
    const Text('Settings'),
  ];

  void onNavigationBarItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      home: Scaffold(
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTap: onNavigationBarItemTap,
        ),
        body: screens.elementAt(_selectedIndex),
      ),
    );
  }
}
