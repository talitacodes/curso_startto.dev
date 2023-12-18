import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertube/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatelessWidget {
  final Video video;
  const VideoPlayer({required this.video, super.key});

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController(
      initialVideoId: video.id,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
        loop: false,
      ),
    );

    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: const ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.white70,
        ),
        aspectRatio: 16.0 / 9.0,
        topActions: const <Widget>[],
      ),
      builder: (context, player) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
          ),
          body: Container(color: Colors.black, child: Center(child: player))),
    );
  }
}
