import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:pokeemon/models/movies_modal.dart';
import 'package:pokeemon/models/series_model.dart';
// Replace with the actual import path

class WatchRepository {
  static Future<List<SeriesData>> fetchSeries() async {
    final jsonString = await rootBundle.loadString('assets/data/seasons.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((data) => SeriesData.fromJson(data)).toList();
  }

    static Future<List<MoviesData>> fetchmMovies() async {
    final jsonString = await rootBundle.loadString('assets/data/movies.json');
    final jsonResponse = json.decode(jsonString) as List;
    return jsonResponse.map((data) => MoviesData.fromJson(data)).toList();
  }
}

