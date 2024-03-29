import 'package:flutter/material.dart';
import 'package:pokeemon/ui/screens/pokedex/pokedex.dart';

import 'package:pokeemon/ui/screens/pokemon_info/pokemon_info.dart';
import 'package:pokeemon/ui/screens/splash/splash.dart';

import 'core/fade_page_route.dart';
import 'ui/screens/home/home.dart';
import 'ui/screens/items/items.dart';
import 'ui/screens/types/type_screen.dart';


enum Routes { splash, home, pokedex, pokemonInfo, typeEffects, items }

class _Paths {
  static const String splash = '/';
  static const String home = '/home';
  static const String pokedex = '/home/pokedex';
  static const String pokemonInfo = '/home/pokemon';
  static const String typeEffectsScreen = '/home/type';
  static const String itemsList = '/home/items';

  static const Map<Routes, String> _pathMap = {
    Routes.splash: _Paths.splash,
    Routes.home: _Paths.home,
    Routes.pokedex: _Paths.pokedex,
    Routes.pokemonInfo: _Paths.pokemonInfo,
    Routes.typeEffects: _Paths.typeEffectsScreen,
    Routes.items: _Paths.itemsList
  };

  static String of(Routes route) => _pathMap[route] ?? splash;
}

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _Paths.splash:
        return FadeRoute(page: SplashScreen());

      case _Paths.pokedex:
        return FadeRoute(page: PokedexScreen());

      case _Paths.pokemonInfo:
        return FadeRoute(page: PokemonInfo());

      case _Paths.typeEffectsScreen:
        return FadeRoute(page: TypeEffectScreen());

      case _Paths.itemsList:
        return FadeRoute(page: ItemsScreen());

      case _Paths.home:
      default:
        return FadeRoute(page: HomeScreen());
    }
  }

  static Future? push<T>(Routes route, [T? arguments]) =>
      state?.pushNamed(_Paths.of(route), arguments: arguments);

  static Future? replaceWith<T>(Routes route, [T? arguments]) =>
      state?.pushReplacementNamed(_Paths.of(route), arguments: arguments);

  static void pop() => state?.pop();

  static NavigatorState? get state => navigatorKey.currentState;
}
