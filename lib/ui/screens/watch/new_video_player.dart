import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String streamUrl;
  final String subtitlesUrl;

  VideoPlayerScreen({
    required this.streamUrl,
    required this.subtitlesUrl,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.streamUrl));
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9, // Default aspect ratio, can be adjusted
      autoInitialize: true,
      autoPlay: true,

      looping: true,

      allowFullScreen: true, // Enable full-screen button
      subtitleBuilder: (context, subtitle) => Container(
        padding: EdgeInsets.all(10),
        child: Text(
          subtitle.text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    _videoPlayerController.dispose();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        fit: BoxFit.fill,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}
