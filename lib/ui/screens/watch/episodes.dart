import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/models/series_model.dart';
import 'package:pokeemon/states/series/series_bloc.dart';
import 'package:pokeemon/states/series/series_state.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokeemon/ui/screens/watch/watch_it_now.dart';

import 'new_video_player.dart';

class EpisodesPage extends StatelessWidget {
  final SeriesData series;

  const EpisodesPage({super.key, required this.series});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Watch Episodes'),
        ),
        body: ListView.builder(
          itemCount: series.media!.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: AnimatedContainerEpisodes(
                description: series.media![index].description.toString(),
                imageUrl: series.media![index].images!.medium.toString(),
                title: series.media![index].episode.toString(),
                series: series.media![index],
              ),
            );
          },
        ));
  }
}

class AnimatedContainerEpisodes extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final SeriesMedia series;

  AnimatedContainerEpisodes({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.series,
  });

  @override
  _AnimatedContainerEpisodesState createState() =>
      _AnimatedContainerEpisodesState();
}

class _AnimatedContainerEpisodesState extends State<AnimatedContainerEpisodes> {
  double _containerHeight = 300.0;
  double _expandedContainerHeight = 350.0;
  bool _isExpanded = false;

  void _toggleContainer() {
    setState(() {
      _isExpanded = !_isExpanded;
      _containerHeight = _isExpanded ? _expandedContainerHeight : 300.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleContainer,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: _containerHeight,
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              widget.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.description,
              style: TextStyle(fontSize: 16.0),
              maxLines: _isExpanded ? null : 2,
              overflow: _isExpanded ? null : TextOverflow.ellipsis,
            ),
            Divider(
              thickness: 0.8,
              color: Colors.grey,
            ),
            if (_isExpanded)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => VideoPlayerScreen(
                                streamUrl: widget.series.streamUrl.toString(), subtitlesUrl: widget.series.captions.toString(),
                              )));
                    },
                    child: Text("watch now"),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}
