import 'package:equatable/equatable.dart';
import 'package:pokeemon/models/movies_modal.dart';

import '../../models/series_model.dart';

abstract class MoviesState extends Equatable {}

class MoviesIntial extends MoviesState {
  @override
  List<Object?> get props => [];
}

class MoviesLoaded extends MoviesState {
  final List<MoviesData> items;

  MoviesLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError(this.message);

  @override
  List<Object?> get props => [message];
}
