import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:poke_dapp_2/common/app_theme/base/app_theme.dart';
import 'package:poke_dapp_2/common/app_theme/light/light_app_theme.dart';
import 'package:poke_dapp_2/main.dart';

final errorLoggerProvider = Provider<ErrorLogger>((ref) => Log().logError);

final appThemeProvider = Provider<AppTheme>(
      (ref) => LightAppTheme(),
);

final isarProvider = Provider<Isar>(
      (_) => throw DatabaseNotStartedException(),
);