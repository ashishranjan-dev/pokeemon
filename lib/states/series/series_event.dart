
import 'package:equatable/equatable.dart';

// Events
abstract class SeriesEvent extends Equatable {}

class FetchSeries extends SeriesEvent {
  @override
  List<Object?> get props => [];
}
