import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/configs/durations.dart';
import 'package:pokeemon/configs/images.dart';
import 'package:pokeemon/core/extensions/animation.dart';
import 'package:pokeemon/domain/entities/pokemon.dart';
import 'package:pokeemon/routes.dart';
import 'package:pokeemon/states/pokemon/pokemon_bloc.dart';
import 'package:pokeemon/states/pokemon/pokemon_event.dart';
import 'package:pokeemon/states/pokemon/pokemon_selector.dart';
import 'package:pokeemon/states/pokemon/pokemon_state.dart';
import 'package:pokeemon/ui/modals/generation_modal.dart';
import 'package:pokeemon/ui/modals/search_modal.dart';
import 'package:pokeemon/ui/widgets/pokemon_card.dart';
import 'package:pokeemon/ui/widgets/animated_overlay.dart';
import 'package:pokeemon/ui/widgets/fab.dart';
import 'package:pokeemon/ui/widgets/main_app_bar.dart';
import 'package:pokeemon/ui/widgets/pokeball_background.dart';
import 'package:pokeemon/ui/widgets/pokemon_refresh_control.dart';




part 'sections/fab_menu.dart';
part 'sections/pokemon_grid.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen();

  @override
  State<StatefulWidget> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _PokemonGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
