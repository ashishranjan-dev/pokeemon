import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/states/item/item_bloc.dart';
import 'package:pokeemon/states/pokemon/pokemon_bloc.dart';
import 'package:pokeemon/states/theme/theme_cubit.dart';

import 'app.dart';
import 'core/network.dart';
import 'data/repositories/item_repository.dart';
import 'data/repositories/pokemon_repository.dart';
import 'data/source/github/github_datasource.dart';
import 'data/source/local/local_datasource.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);

  await LocalDataSource.initialize();

  runApp(
    MultiRepositoryProvider(
      providers: [
        ///
        /// Services
        ///
        RepositoryProvider<NetworkManager>(
          create: (context) => NetworkManager(),
        ),

        ///
        /// Data sources
        ///
        RepositoryProvider<LocalDataSource>(
          create: (context) => LocalDataSource(),
        ),
        RepositoryProvider<GithubDataSource>(
          create: (context) => GithubDataSource(context.read<NetworkManager>()),
        ),

        ///
        /// Repositories
        ///
        RepositoryProvider<PokemonRepository>(
          create: (context) => PokemonDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),

        RepositoryProvider<ItemRepository>(
          create: (context) => ItemDefaultRepository(
            localDataSource: context.read<LocalDataSource>(),
            githubDataSource: context.read<GithubDataSource>(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          ///
          /// BLoCs
          ///
          BlocProvider<PokemonBloc>(
            create: (context) => PokemonBloc(context.read<PokemonRepository>()),
          ),
          BlocProvider<ItemBloc>(
            create: (context) => ItemBloc(context.read<ItemRepository>()),
          ),

          ///
          /// Theme Cubit
          ///
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
          )
        ],
        child: PokemonApp(),
      ),
    ),
  );
}
