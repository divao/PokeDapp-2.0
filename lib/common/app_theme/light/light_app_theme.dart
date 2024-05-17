import 'package:flutter/material.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';

part './colors/light_colors.dart';

class LightAppTheme implements AppTheme {

  @override
  AppColors get colors => LightColors();
}

const _englishVermillion = Color(0xFFC84646);
const _white = Color(0xFFFFFFFF);
const _graniteGray = Color(0xFF666666);