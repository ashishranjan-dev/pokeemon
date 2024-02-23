import 'package:equatable/equatable.dart';

// Events
abstract class MoviesEvent extends Equatable {}

class FetchMovies extends MoviesEvent {
  @override
  List<Object?> get props => [];
}
