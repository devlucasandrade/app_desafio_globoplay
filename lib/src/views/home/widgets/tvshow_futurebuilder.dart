import 'package:app_desafio_globoplay/src/repository/tvshow_repository.dart';
import 'package:flutter/material.dart';

import '../../../models/tvshow/tvshow_model.dart';
import '../../tvshows/pages/tvshows_details_page.dart';

class TVShowFutureBuilder extends StatelessWidget {
  const TVShowFutureBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvShowModel>(
      future: TVShowRepository().fetchTVShows(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Séries Populares',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data!.results!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TVShowDetailsPage(
                                tvId: data.results![index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w400/${data.results![index].posterPath}',
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
