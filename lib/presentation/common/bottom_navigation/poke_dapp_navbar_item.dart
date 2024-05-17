import 'package:flutter/material.dart';

class PokeDappNavBarItem {
  PokeDappNavBarItem({
    required this.navigatorKey,
    required this.title,
    this.icon,
    this.svgIcon,
    this.key,
  });

  Key? key;
  final IconData? icon;
  final String? svgIcon;
  final String title;
  final GlobalKey<NavigatorState> navigatorKey;
}
