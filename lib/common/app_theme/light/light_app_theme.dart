import 'package:flutter/material.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';

part './colors/light_colors.dart';
part './assets/light_assets_paths.dart';
part './text_styles/light_text_styles.dart';

class LightAppTheme implements AppTheme {

  @override
  AppColors get colors => LightColors();

  @override
  AppAssetsPaths get assets => LightAssetsPaths();

  @override
  AppTextStyles get textStyles => LightTextStyles();
}

const _englishVermillion = Color(0xFFC84646);
const _white = Color(0xFFFFFFFF);
const _black = Color(0xFF000000);
const _graniteGray = Color(0xFF666666);
const _taupeGray = Color(0xFF888888);

const _montserratFontFamily = 'Montserrat';