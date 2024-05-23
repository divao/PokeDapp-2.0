import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/widgets/pokemon_stat_progress_indicator.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/widgets/pokemon_stats_list.dart';
import 'package:poke_dapp_2/presentation/utils/view_utils.dart';
import 'package:poke_dapp_2/presentation/common/async_snapshot_response_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_bloc.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/pokemon_detail_states.dart';

class PokemonDetailPage extends ConsumerStatefulWidget {
  const PokemonDetailPage({
    required this.bloc,
    required this.pokemonId,
    super.key,
  });

  static Widget create({
    required int pokemonId,
  }) =>
      Consumer(
        builder: (_, ref, __) {
          final bloc = ref.watch(pokemonDetailBlocProvider(pokemonId));
          return PokemonDetailPage(bloc: bloc, pokemonId: pokemonId);
        },
      );

  final int pokemonId;
  final PokemonDetailBloc bloc;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage>
    with WidgetsBindingObserver {
  PokemonDetailBloc get _bloc => widget.bloc;

  final _player = AudioPlayer();

  Future<void> _loadAudio(String audioUrl) async {
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
    } catch (e) {
      Future.delayed(Duration.zero, _player.stop);
    }
  }

  Future<void> _loadAudioAndPlay(String audioUrl) async {
    try {
      await _player.setAudioSource(AudioSource.uri(Uri.parse(audioUrl)));
      Future.delayed(Duration.zero, _player.play);
    } catch (e) {
      Future.delayed(Duration.zero, _player.stop);
    }
  }

  Future<void> _playAudio(String audioUrl) async {
      await _loadAudioAndPlay(audioUrl);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PokemonDetailState>(
      stream: _bloc.pokemonDetailStream,
      builder: (context, snapshot) {
        return AsyncSnapshotResponseView<Loading, Error, Success>(
            snapshot: snapshot,
            onTryAgainTap: () => _bloc.onTryAgainSink.add(null),
            successWidgetBuilder: (context, success) {
              final pokemon = success.pokemonDetail;
              _loadAudio(pokemon.cryUrl);
              return Scaffold(
                backgroundColor: ref.colors.surfaceColor,
                appBar: AppBar(
                  title: Text(
                    pokemon.name,
                    style: ref.textStyles.appBarTitle,
                  ),
                  backgroundColor: ref.colors.primaryColor,
                  iconTheme: IconThemeData(color: ref.colors.surfaceColor),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.volume_up),
                      onPressed: () => _playAudio(pokemon.cryUrl),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: pokemon.imageUrl,
                              height: 160,
                              width: 160,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Icon(
                                Icons.image_outlined,
                                size: 48,
                                color: ref.colors.imagePlaceholderColor,
                              ),
                              errorWidget: (context, url, error) => Icon(
                                Icons.error,
                                size: 48,
                                color: ref.colors.imagePlaceholderColor,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ref.s.pokemonNumber(pokemon.id),
                                    style: ref.textStyles.pokemonDetailNumber,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    pokemon.description,
                                    style:
                                        ref.textStyles.pokemonDetailDescription,
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      for (var i = 0;
                                          i < pokemon.types.length;
                                          i++)
                                        Padding(
                                          padding: EdgeInsets.only(
                                              right:
                                                  i < pokemon.types.length - 1
                                                      ? 8
                                                      : 0),
                                          child: Image.asset(
                                            pokemonTypeToAssetPath(
                                              ref,
                                              pokemon.types[i],
                                            ),
                                            width: 84,
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        PokemonStatsList(stats: pokemon.stats),
                      ],
                    ),
                  ),
                ),
              );
            });
      },
    );
  }
}
