import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/configs/constants.dart';
import 'package:pokeemon/configs/theme.dart';
import 'package:pokeemon/routes.dart';
import 'package:pokeemon/states/theme/theme_cubit.dart';

class PokemonApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeCubit = BlocProvider.of<ThemeCubit>(context, listen: true);
    var isDark = themeCubit.isDark;

    return MaterialApp(
      color: Colors.white,
      title: 'Flutter pokeemon',
      debugShowCheckedModeBanner: false,
      theme: isDark ? Themings.darkTheme : Themings.lightTheme,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      builder: (context, child) {
        if (child == null) return SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor =
            min(smallestSize / AppConstants.designScreenSize.width, 1.0);

        return MediaQuery(
          data: data.copyWith(
            textScaleFactor: textScaleFactor,
          ),
          child: child,
        );
      },
    );
  }
}
