import 'package:app_desafio_globoplay/src/models/tvshow/tvshow_model.dart';
import 'package:app_desafio_globoplay/src/repository/tvshow_repository.dart';
import 'package:flutter/material.dart';

import '../pages/tvshows_details_page.dart';

class TVShowTrendingFutureBuilder extends StatelessWidget {
  const TVShowTrendingFutureBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TvShowModel>(
      future: TVShowRepository().fetchTrending(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  mainAxisExtent: 150,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
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
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w400/${data.results![index].posterPath}',
                      fit: BoxFit.fitHeight,
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
