import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../models/movies/movies_model.dart';
import '../../../repository/movies_repository.dart';
import '../../movies/pages/movies_details_page.dart';

class MoviesFutureBuilder extends StatelessWidget {
  const MoviesFutureBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customCacheManager = CacheManager(
      Config(
        'customCachedKey',
        stalePeriod: const Duration(days: 5),
      ),
    );

    return FutureBuilder<MoviesModel>(
      future: MoviesRepository().fetchMovies(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
            height: 200,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          final data = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Filmes',
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
                              builder: (context) => MoviesDetailsPage(
                                id: data.results![index].id,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              key: UniqueKey(),
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w400/${data.results![index].posterPath}',
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  Container(color: Colors.black12),
                              errorWidget: (context, url, error) => Container(
                                color: Colors.black12,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.red,
                                  size: 80,
                                ),
                              ),
                            ),
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
