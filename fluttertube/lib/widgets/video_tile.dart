import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/video_player.dart';

class VideoTile extends StatelessWidget {
  final Video video;
  const VideoTile(this.video, {super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.getBloc<FavoriteBloc>();
    return GestureDetector(
      onTap: (() {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => VideoPlayer(video: video),
          ),
        );
      }),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Image.network(
                video.thumb,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            video.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            video.channel,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14),
                          ),
                        ),
                      ]),
                ),
                StreamBuilder<Map<String, Video>>(
                  stream: bloc.outFav,
                  initialData: const {},
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return IconButton(
                        onPressed: () {
                          bloc.toggleFavorite(video);
                        },
                        icon: Icon(
                          snapshot.data!.containsKey(video.id)
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.white,
                          size: 30,
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
