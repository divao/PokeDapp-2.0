import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';

import 'common/providers/general_provider.dart';
import 'common/routing.dart';
import 'generated/l10n.dart';

class Log {
  Logger logger = Logger(printer: PrettyPrinter());

  Future<void> logError(
    String errorType,
    dynamic error, [
    StackTrace? stackTrace,
  ]) async {
    logger.e(errorType, error: error, stackTrace: stackTrace);
  }
}

void main() async {
  final errorLogger = Log().logError;

  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // TODO: Tirar comentário ao implementar o cache
      // final dir = await getApplicationDocumentsDirectory();
      //
      // final isar = await Isar.open(
      //   [],
      //   directory: dir.path,
      // );

      await SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ],
      );

      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      );
      runApp(
        ProviderScope(
          // overrides: [
          //   isarProvider.overrideWithValue(isar),
          // ],
          child: const _MyApp(),
        ),
      );
    },
    (error, stackTrace) async {
      await errorLogger(
        'Zoned Guarded Error',
        error,
        stackTrace,
      );
    },
  );
}

class _MyApp extends ConsumerWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routes = ref.watch(goRouterProvider);
    return MaterialApp.router(
      title: 'PokéDapp',
      routerConfig: routes,
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(
        primarySwatch: ref.colors.primaryColor,
      ),
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
