import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';

class EmptyState extends ConsumerWidget {
  const EmptyState({
    required this.errorText,
    required this.onTryAgainTap,
    super.key,
  });

  final String errorText;
  final VoidCallback? onTryAgainTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText,
            style: ref.textStyles.errorText,
          ),
          const SizedBox(height: 4),
          TextButton(
              onPressed: onTryAgainTap,
              style: TextButton.styleFrom(
                foregroundColor: ref.colors.primaryColor,
              ),
              child: Text(ref.s.tryAgain)),
        ],
      ),
    );
  }
}
