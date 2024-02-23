import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokeemon/configs/colors.dart';
import 'package:pokeemon/configs/images.dart';
import 'package:pokeemon/data/categories.dart';
import 'package:pokeemon/domain/entities/category.dart';
import 'package:pokeemon/states/movies/movies_bloc.dart';
import 'package:pokeemon/states/movies/movies_event.dart';
import 'package:pokeemon/states/series/series_event.dart';
import 'package:pokeemon/ui/screens/watch/watchmovies.dart';
import 'package:pokeemon/ui/widgets/search_bar.dart';
import 'package:pokeemon/ui/widgets/pokeball_background.dart';
import 'package:pokeemon/routes.dart';

import '../../../configs/colors.dart';
import '../../../configs/images.dart';
import '../../../data/categories.dart';
import '../../../domain/entities/category.dart';
import '../../../routes.dart';
import '../../../states/series/series_bloc.dart';
import '../../../states/theme/theme_cubit.dart';
import '../../widgets/pokeball_background.dart';
import '../watch/watch_series.dart';
import 'widgets/news_card.dart';
import 'widgets/category_card.dart';

part 'sections/pokemon_news.dart';
part 'sections/header_card_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  bool showTitle = false;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final offset = _scrollController.offset;
    final showTitle = offset > _HeaderCardContent.height - kToolbarHeight;

    // Prevent unneccesary rebuild
    if (this.showTitle == showTitle) return;

    setState(() {
      this.showTitle = showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (_, __) => [
          SliverAppBar(
            expandedHeight: _HeaderCardContent.height,
            floating: true,
            pinned: true,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            backgroundColor: AppColors.red,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              centerTitle: true,
              title: Visibility(
                visible: showTitle,
                child: Text(
                  'Pokedex',
                  style: Theme.of(context)
                      .appBarTheme
                      .toolbarTextStyle!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              background: _HeaderCardContent(),
            ),
          ),
        ],
        body: _PokemonNews(),
      ),
    );
  }
}
