import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_detail_vm.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/widgets/pokemon_stat_progress_indicator.dart';
import 'package:poke_dapp_2/presentation/utils/view_utils.dart';

class PokemonStatsList extends ConsumerWidget {
  const PokemonStatsList({
    required this.stats,
    super.key,
  });

  final List<PokemonStatVM> stats;

  double _calculateMaxWidth(WidgetRef ref, List<String> texts) {
    final textStyle = ref.textStyles.pokemonDetailStats;
    double maxWidth = 0;

    for (var text in texts) {
      final textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        maxLines: 1,
        textDirection: TextDirection.ltr,
      )..layout();

      if (textPainter.width > maxWidth) {
        maxWidth = textPainter.width;
      }
    }

    return maxWidth * 1.2;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final startMaxWidth = _calculateMaxWidth(ref, stats.map((stat) => statToString(ref, stat.name)).toList());
    final endMaxWidth = _calculateMaxWidth(ref, stats.map((stat) => stat.value.toString()).toList());
    return Column(
        children: [
          for (var stat in stats)
            PokemonStatProgressIndicator(
              statName: statToString(ref, stat.name),
              statValue: stat.value,
              startChildMaxWidth: startMaxWidth,
              endChildMaxWidth: endMaxWidth,
            ),
        ],
      );
  }
}

