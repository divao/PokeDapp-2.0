import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/common/routing.dart';
import 'package:poke_dapp_2/common/utils/utils.dart';
import 'package:poke_dapp_2/data/view/model/pokemon_summary_vm.dart';

class PokemonSummaryItem extends ConsumerWidget {
  const PokemonSummaryItem({
    required this.pokemonSummary,
    super.key,
  });

  final PokemonSummaryVM pokemonSummary;

  @override
  Widget build(BuildContext context, WidgetRef ref) => GestureDetector(
        onTap: () => ref.goRouter.goPokemonDetail(
          currentPath:
              ref.goRouter.routeInformationProvider.value.uri.toString(),
          pokemonId: pokemonSummary.id,
        ),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: pokemonSummary.imageUrl,
              height: 64,
              width: 64,
              fit: BoxFit.cover,
              placeholder: (context, url) => Icon(
                Icons.image_outlined,
                size: 36,
                color: ref.colors.imagePlaceholderColor,
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                size: 36,
                color: ref.colors.imagePlaceholderColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              pokemonSummary.name.capitalize(),
              style: ref.textStyles.pokemonSummaryName,
            ),
          ],
        ),
      );
}
