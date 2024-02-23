import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/configs/durations.dart';
import 'package:pokeemon/configs/images.dart';
import 'package:pokeemon/core/extensions/animation.dart';
import 'package:pokeemon/states/item/item_bloc.dart';
import 'package:pokeemon/states/item/item_event.dart';
import 'package:pokeemon/states/item/item_selector.dart';
import 'package:pokeemon/states/item/item_state.dart';
import 'package:pokeemon/ui/modals/generation_modal.dart';
import 'package:pokeemon/ui/modals/search_modal.dart';
import 'package:pokeemon/ui/widgets/animated_overlay.dart';
import 'package:pokeemon/ui/widgets/fab.dart';
import 'package:pokeemon/ui/widgets/main_app_bar.dart';
import 'package:pokeemon/ui/widgets/pokeball_background.dart';
import 'package:pokeemon/ui/widgets/pokemon_refresh_control.dart';
import 'package:pokeemon/core/extensions/animation.dart';

import '../../../configs/durations.dart';
import '../../../configs/images.dart';
import '../../../states/item/item_bloc.dart';
import '../../../states/item/item_event.dart';
import '../../../states/item/item_selector.dart';
import '../../../states/item/item_state.dart';
import '../../modals/generation_modal.dart';
import '../../modals/search_modal.dart';
import '../../widgets/animated_overlay.dart';
import '../../widgets/fab.dart';
import '../../widgets/main_app_bar.dart';
import '../../widgets/pokemon_refresh_control.dart';
import 'widgets/item_card.dart';

part 'sections/fab_menu.dart';
part 'sections/items_grid.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen();

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return PokeballBackground(
      child: Stack(
        children: [
          _ItemGrid(),
        ],
      ),
    );
  }
}
