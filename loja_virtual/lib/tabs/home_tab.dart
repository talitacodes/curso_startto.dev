import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  Widget _buildBodyBack() => Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 24, 34, 60),
              Color.fromARGB(255, 230, 194, 217),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBodyBack(),
        CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection('home')
                  .orderBy("pos")
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      height: 200.0,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white)),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: GridView.custom(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverQuiltedGridDelegate(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1.0,
                            crossAxisSpacing: 1.0,
                            repeatPattern: QuiltedGridRepeatPattern.inverted,
                            pattern: snapshot.data!.docs.map((e) {
                              return QuiltedGridTile(e['y'], e['x']);
                            }).toList()),
                        childrenDelegate: SliverChildBuilderDelegate(
                          (context, index) => FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: snapshot.data!.docs[index]['image'],
                            fit: BoxFit.cover,
                          ),
                          childCount: snapshot.data!.docs.length,
                        )),
                  );
                }
              },
            ),
          ],
        )
      ],
    );
  }
}
