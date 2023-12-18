import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: "",
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    final bloc = BlocProvider.getBloc<FavoriteBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Favorites"),
          centerTitle: true,
          backgroundColor: Colors.black87,
        ),
        backgroundColor: Colors.black87,
        body: StreamBuilder<Map<String, Video>>(
          stream: bloc.outFav,
          initialData: const {},
          builder: (context, snapshot) {
            return ListView(
              children: snapshot.data!.values.map((v) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => VideoPlayer(video: v),
                      ),
                    );
                  },
                  onLongPress: () {
                    bloc.toggleFavorite(v);
                  },
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 50,
                        child: Image.network(v.thumb),
                      ),
                      Expanded(
                        child: Text(
                          v.title,
                          style: const TextStyle(color: Colors.white70),
                        ),
                      )
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}
