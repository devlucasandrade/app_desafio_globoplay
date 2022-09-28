import 'package:app_movie/src/views/tvshows/pages/tvshows_details_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:provider/provider.dart';

import '../../../provider/favorites_provider.dart';
import '../../movies/pages/movies_details_page.dart';

class MoviesFavoritePage extends StatelessWidget {
  const MoviesFavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);

    final customCacheManager = CacheManager(
      Config(
        'customCachedKey',
        stalePeriod: const Duration(days: 5),
      ),
    );

    return provider.favoritesMovies.isEmpty
        ? const Center(
            child: Text(
              'Lista de favoritos vazia',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          )
        : Scaffold(
            body: Container(
              padding: const EdgeInsets.all(10),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  mainAxisExtent: 180,
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 10,
                ),
                itemCount: provider.favoritesMovies.length,
                itemBuilder: (context, index) {
                  final id = provider.favoritesMovies[index];
                  final posterPath = provider.posterPath[index];
                  final type = provider.type[index];

                  return GestureDetector(
                    onTap: type == 'filme'
                        ? () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoviesDetailsPage(
                                  id: id,
                                ),
                              ),
                            )
                        : () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TVShowDetailsPage(
                                  id: id,
                                ),
                              ),
                            ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        cacheManager: customCacheManager,
                        key: UniqueKey(),
                        imageUrl: 'https://image.tmdb.org/t/p/w400/$posterPath',
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
                  );
                },
              ),
            ),
          );
  }
}
