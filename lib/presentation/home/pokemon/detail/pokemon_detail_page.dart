import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:poke_dapp_2/common/analytics_logger.dart';
import 'package:poke_dapp_2/common/app_theme/base/theme_extension.dart';
import 'package:poke_dapp_2/common/providers/general_provider.dart';
import 'package:poke_dapp_2/presentation/common/pokedapp_view_keys.dart';
import 'package:poke_dapp_2/presentation/common/utils/generic_error_view.dart';
import 'package:poke_dapp_2/presentation/common/widgets/empty_state/general_empty_state.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/bloc/pokemon_detail_event.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/widgets/pokemon_stats_list.dart';
import 'package:poke_dapp_2/presentation/utils/view_utils.dart';
import 'package:poke_dapp_2/presentation/common/state_response_view.dart';
import 'package:poke_dapp_2/presentation/home/pokemon/detail/bloc/pokemon_detail_bloc.dart';

import 'bloc/pokemon_detail_state.dart';

class PokemonDetailPage extends ConsumerStatefulWidget {
  const PokemonDetailPage({
    required this.bloc,
    required this.pokemonId,
    this.analyticsLogger,
    super.key,
  });

  static Widget create({
    required int pokemonId,
  }) =>
      Consumer(
        builder: (_, ref, __) {
          final bloc = ref.watch(pokemonDetailBlocProvider(pokemonId));
          final analytics = ref.watch(analyticsLoggerProvider);
          return PokemonDetailPage(bloc: bloc, pokemonId: pokemonId, analyticsLogger: analytics);
        },
      );

  final int pokemonId;
  final PokemonDetailBloc bloc;
  final AnalyticsLogger? analyticsLogger;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailPageState();
}

class _PokemonDetailPageState extends ConsumerState<PokemonDetailPage>
    with WidgetsBindingObserver {
  PokemonDetailBloc get _bloc => widget.bloc;
  AnalyticsLogger? get _analyticsLogger => widget.analyticsLogger;

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
      _analyticsLogger?.logPokemonCryPlayed(widget.pokemonId);
    } catch (e) {
      Future.delayed(Duration.zero, _player.stop);
      await _showAudioErrorDialog();
    }
  }

  Future<void> _playAudio(String audioUrl) async {
    await _loadAudioAndPlay(audioUrl);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _bloc.add(GetPokemonDetail());
    _analyticsLogger?.logPokemonDetailViewed(widget.pokemonId);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  Future<void> _showAudioErrorDialog() async {
    await showDialog<AlertDialog>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(ref.s.audioErrorTitle),
          titleTextStyle: ref.textStyles.dialogTitle,
          content: Text(ref.s.audioErrorMessage),
          contentTextStyle: ref.textStyles.dialogContent,
          backgroundColor: ref.colors.surfaceColor,
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
              child: Text(ref.s.ok, style: ref.textStyles.dialogTextButton),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailBloc, PokemonDetailState>(
      bloc: _bloc,
      builder: (context, state) {
        return StateResponseView<Loading, Error, Success>(
            state: state,
            onTryAgainTap: () => _bloc.add(TryAgain()),
            errorWidgetBuilder: (context, error, onTryAgain) {
              return Scaffold(
                backgroundColor: ref.colors.surfaceColor,
                appBar: AppBar(
                  title: Text(
                    ref.s.pokemonDetailTitle,
                    style: ref.textStyles.appBarTitle,
                  ),
                  backgroundColor: ref.colors.primaryColor,
                  iconTheme: IconThemeData(color: ref.colors.surfaceColor),
                ),
                body: GeneralEmptyState(
                  onTryAgain: onTryAgain,
                  errorType: error?.type ?? GenericErrorViewType.unexpected,
                ),
              );
            },
            loadingWidgetBuilder: (context, loading) {
              return Scaffold(
                backgroundColor: ref.colors.surfaceColor,
                appBar: AppBar(
                  title: Text(
                    ref.s.pokemonDetailTitle,
                    style: ref.textStyles.appBarTitle,
                  ),
                  backgroundColor: ref.colors.primaryColor,
                  iconTheme: IconThemeData(color: ref.colors.surfaceColor),
                ),
                body: Center(
                  child: CircularProgressIndicator(
                    color: ref.colors.primaryColor,
                  ),
                ),
              );
            },
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
                    StreamBuilder<PlayerState>(
                        stream: _player.playerStateStream,
                        builder: (context, snapshot) {
                          final playerState = snapshot.data;
                          final processingState = playerState?.processingState;
                          if (processingState == ProcessingState.loading) {
                            return IconButton(
                              icon: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: ref.colors.surfaceColor,
                                ),
                              ),
                              onPressed: null,
                            );
                          } else {
                            return IconButton(
                              icon: const Icon(Icons.volume_up),
                              onPressed: () => _playAudio(pokemon.cryUrl),
                            );
                          }
                        }),
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
                                    key: PokeDappViewKeys.pokemonDetailPagePokemonNumber,
                                    ref.s.pokemonNumber(pokemon.id),
                                    style: ref.textStyles.pokemonDetailNumber,
                                    textAlign: TextAlign.justify,
                                  ),
                                  Text(
                                    key: PokeDappViewKeys.pokemonDetailPagePokemonDescription,
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
