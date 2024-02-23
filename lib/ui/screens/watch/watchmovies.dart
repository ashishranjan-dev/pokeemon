import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokeemon/models/series_model.dart';
import 'package:pokeemon/states/movies/movies_bloc.dart';
import 'package:pokeemon/states/movies/movies_state.dart';
import 'package:pokeemon/states/series/series_bloc.dart';
import 'package:pokeemon/states/series/series_state.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:pokeemon/ui/screens/watch/episodes.dart';
import 'package:pokeemon/ui/screens/watch/watch_it_now.dart';

import '../../../models/movies_modal.dart';
import 'new_video_player.dart';

class MoviesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Watch Movies'),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesIntial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MoviesLoaded) {
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onLongPress: () {},
                  title: AnimatedContainerWithText(
                    description:
                        state.items[index].channelDescription.toString(),
                    imageUrl: state
                        .items[index].channelImages.spotlightImage1660940
                        .toString(),
                    title: state.items[index].channelName.toString(),
                    data: state.items[index],
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class AnimatedContainerWithText extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;
  final MoviesData data;

  AnimatedContainerWithText({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.data,
  });

  @override
  _AnimatedContainerWithTextState createState() =>
      _AnimatedContainerWithTextState();
}

class _AnimatedContainerWithTextState extends State<AnimatedContainerWithText> {
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
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInCubic,
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
                                streamUrl: widget.data.media[0].streamUrl.toString(),
                                subtitlesUrl: widget.data.media[0].captions.toString(),
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
