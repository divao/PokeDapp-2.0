import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';
import 'package:poke_dapp_2/generated/l10n.dart';


extension RefTheme on WidgetRef {
  AppColors get colors => AppTheme.of(this).colors;

  AppAssetsPaths get assets => AppTheme.of(this).assets;

  AppTextStyles get textStyles => AppTheme.of(this).textStyles;

  S get s => S.of(context);
}

extension ThemeExtension on ConsumerState {
  AppColors get colors => ref.colors;

  AppAssetsPaths get assets => ref.assets;

  AppTextStyles get textStyles => ref.textStyles;

  S get s => ref.s;
}