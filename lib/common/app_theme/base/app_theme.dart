import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';

part './colors/app_colors.dart';

abstract class AppTheme {
  static AppTheme of(WidgetRef ref) {
    return ref.watch<AppTheme>(appThemeProvider);
  }

  AppColors get colors;
}
