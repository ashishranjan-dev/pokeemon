import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokeemon/models/movies_modal.dart';

import '../../models/watch_repositry.dart';
import 'movies_event.dart';
import 'movies_state.dart';


class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesIntial()) {
    on((event, emit) async {
      if (event is FetchMovies) {
        List<MoviesData> data = await WatchRepository.fetchmMovies();
        emit(MoviesLoaded(data));
      }
    });
  }
}
