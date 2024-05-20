import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/common/bottom_navigation/poke_dapp_navbar.dart';
import 'package:poke_dapp_2/presentation/common/bottom_navigation/poke_dapp_navbar_item.dart';

class PokeDappNavBarScaffold extends ConsumerStatefulWidget {
  const PokeDappNavBarScaffold({
    required this.navigationBarItems,
    required this.navigationShell,
    this.initialIndex,
    super.key,
  });

  final List<PokeDappNavBarItem> navigationBarItems;
  final int? initialIndex;
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokeDappNavBarScaffoldState();
}

class _PokeDappNavBarScaffoldState extends ConsumerState<PokeDappNavBarScaffold> {
  StatefulNavigationShell get _navigationShell => widget.navigationShell;

  void _onTabSelected(int index) {
    _navigationShell.goBranch(
      index,
      initialLocation: index == _navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.surfaceColor,
      bottomNavigationBar: PokeDappNavBar(
        barItems: widget.navigationBarItems,
        onTap: _onTabSelected,
        currentIndex: _navigationShell.currentIndex,
        backgroundColor: colors.bottomNavigationBarColor,
        height: 56,
        buttonHeight: 46,
        buttonWidth: 80,
        selectedIconColor: colors.bottomNavigationBarSelectedIconColor,
        unselectedIconColor: colors.bottomNavigationBarUnselectedIconColor,
        selectedTextStyle: textStyles.bottomNavigationSelectedText,
        unselectedTextStyle: textStyles.bottomNavigationUnselectedText,
      ),
      body: _navigationShell,
    );
  }
}