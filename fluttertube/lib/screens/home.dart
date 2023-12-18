import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/blocs/videos_bloc.dart';
import 'package:fluttertube/delegates/data_search.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/favorites.dart';
import 'package:fluttertube/widgets/video_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final blocVideos = BlocProvider.getBloc<VideosBloc>();
    final blocFav = BlocProvider.getBloc<FavoriteBloc>();
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: SizedBox(
          height: 25,
          child: Image.asset("images/yt_logo_rgb_dark.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.black87,
        actions: [
          Align(
              alignment: Alignment.center,
              child: StreamBuilder<Map<String, Video>>(
                stream: blocFav.outFav,
                initialData: const {},
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.length.toString());
                  } else {
                    return Container();
                  }
                },
              )),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => const Favorites())));
              },
              icon: const Icon(Icons.star)),
          IconButton(
              onPressed: () async {
                String? result =
                    await showSearch(context: context, delegate: DataSearch());

                if (result != null) {
                  blocVideos.inSearch.add(result);
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: StreamBuilder(
        initialData: const [],
        stream: blocVideos.outVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length + 1,
              itemBuilder: (context, index) {
                if (index < snapshot.data.length) {
                  return VideoTile(snapshot.data[index]);
                } else if (index > 1) {
                  blocVideos.inSearch.add(null);
                  return Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.red)),
                  );
                } else {
                  return Container();
                }
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
