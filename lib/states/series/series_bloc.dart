import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/models/series_model.dart';
import 'package:pokeemon/states/series/series_event.dart';
import 'package:pokeemon/states/series/series_state.dart';

import '../../models/watch_repositry.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  SeriesBloc() : super(SeriesInitial()) {
    on((event, emit) async {
      if (event is FetchSeries) {
        List<SeriesData> data = await WatchRepository.fetchSeries();
        emit(SeriesLoaded(data));
      }
    });
  }
}
