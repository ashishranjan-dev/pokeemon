import 'package:equatable/equatable.dart';

import '../../models/series_model.dart';

abstract class SeriesState extends Equatable {}

class SeriesInitial extends SeriesState {
  @override
  List<Object?> get props => [];
}

class SeriesLoaded extends SeriesState {
  final List<SeriesData> items;

  SeriesLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class SeriesError extends SeriesState {
  final String message;

  SeriesError(this.message);

  @override
  List<Object?> get props => [message];
}
