import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/common/widgets/empty_state/empty_state.dart';

class GeneralEmptyState extends ConsumerWidget {
  const GeneralEmptyState({
    required this.onTryAgain,
    required this.errorType,
    super.key,
  });

  final VoidCallback onTryAgain;
  final GenericErrorViewType errorType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (errorType) {
      GenericErrorViewType.noConnection =>
          EmptyState(
            errorText: ref.s.noInternetError,
            onTryAgainTap: onTryAgain,
          ),
      GenericErrorViewType.timeout =>
          EmptyState(
            errorText: ref.s.timeoutError,
            onTryAgainTap: onTryAgain,
          ),
      _ =>
          EmptyState(
            errorText: ref.s.genericError,
            onTryAgainTap: onTryAgain,
          ),
    };
  }
}