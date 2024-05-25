import 'package:dinnerdive/pages/home/homepage.dart';
import 'package:dinnerdive/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key});

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];
  @override
  final _mystyle = const TextStyle(
      fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
  @override
  void initState() {
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'Dinner Dive',
            baseStyle: _mystyle,
            selectedStyle: _mystyle,
            colorLineSelected: Colors.blue,
          ),
          const MyHome()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
              name: 'Profile',
              baseStyle: _mystyle,
              selectedStyle: _mystyle,
              colorLineSelected: Colors.blue),
          const ProfilePage()),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        leadingAppBar: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        backgroundColorAppBar: Colors.deepOrange.shade300,
        initPositionSelected: 0,
        screens: _pages,
        backgroundColorMenu: Colors.deepOrange.shade300,
        slidePercent: 40,
        contentCornerRadius: 30);
  }
}
