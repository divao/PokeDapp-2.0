import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';

class PokemonStatProgressIndicator extends ConsumerStatefulWidget {
  const PokemonStatProgressIndicator({
    required this.statName,
    required this.statValue,
    required this.startChildMaxWidth,
    required this.endChildMaxWidth,
    super.key,
  });

  final String statName;
  final int statValue;
  final double startChildMaxWidth;
  final double endChildMaxWidth;

  @override
  ConsumerState<PokemonStatProgressIndicator> createState() =>
      _PokemonStatProgressIndicatorState();
}

class _PokemonStatProgressIndicatorState
    extends ConsumerState<PokemonStatProgressIndicator> {
  double get progressPercentageFactor => widget.statValue / 255;

  double actualProgressPercentageFactor = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        actualProgressPercentageFactor = progressPercentageFactor;
      });
    });
  }

  @override
  void didUpdateWidget(PokemonStatProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.statValue / 255.0 != progressPercentageFactor) {
      setState(() {
        actualProgressPercentageFactor = progressPercentageFactor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.startChildMaxWidth,
          child: Text(
            widget.statName,
            style: ref.textStyles.pokemonDetailStats,
            textAlign: TextAlign.end,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: ref.colors.pokemonStatBaseColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              AnimatedFractionallySizedBox(
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.fastOutSlowIn,
                widthFactor: actualProgressPercentageFactor,
                child: Container(
                  height: 14,
                  decoration: BoxDecoration(
                    color: ref.colors.pokemonStatProgressColor,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: widget.endChildMaxWidth,
          child: Text(
            widget.statValue.toString(),
            style: ref.textStyles.pokemonDetailStats,
          ),
        ),
      ],
    );
  }
}
