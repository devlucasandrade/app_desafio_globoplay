import 'package:flutter/material.dart';

import '../../../models/movies/movies_model.dart';
import '../../../repository/movies_repository.dart';
import '../pages/movies_details_page.dart';

class MoviesTrendingFutureBuilder extends StatelessWidget {
  const MoviesTrendingFutureBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesModel>(
      future: MoviesRepository().fetchTrending(),
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
                itemCount: data?.results?.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MoviesDetailsPage(
                            id: data?.results![index].id,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w400/${data?.results![index].posterPath}',
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
