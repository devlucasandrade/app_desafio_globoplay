import 'package:app_desafio_globoplay/src/repository/tvshow_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../../../models/tvshow/tvshow_details_model.dart';
import '../widgets/tvshows_details_bottom.dart';
import '../widgets/tvshows_details_buttons.dart';
import '../widgets/tvshows_trending_futurebuilder.dart';

class TVShowDetailsPage extends StatefulWidget {
  const TVShowDetailsPage({
    Key? key,
    required this.tvId,
  }) : super(key: key);
  final int? tvId;

  @override
  State<TVShowDetailsPage> createState() => _TVShowDetailsPageState();
}

class _TVShowDetailsPageState extends State<TVShowDetailsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    final customCacheManager = CacheManager(
      Config(
        'customCachedKey',
        stalePeriod: const Duration(days: 5),
      ),
    );

    return FutureBuilder<TvShowDetailsModel>(
      future: TVShowRepository().fetchTVShowsDetails(widget.tvId),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final data = snapshot.data;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w400${data?.posterPath}',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black,
                  ],
                ),
              ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.grey,
                          padding: const EdgeInsets.all(1),
                          width: 120,
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              key: UniqueKey(),
                              imageUrl:
                                  'https://image.tmdb.org/t/p/w200${data?.posterPath}',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 5),
                        child: Text(
                          data!.name.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          '${data.tagline}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const TVShowButtons(),
                      const SizedBox(height: 20),
                      SizedBox(
                        child: TabBar(
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey.shade600,
                          indicatorColor: Colors.white,
                          controller: tabController,
                          tabs: const [
                            Tab(text: 'ASSISTA TAMBÉM'),
                            Tab(text: 'DETALHES'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TabBarView(
                            controller: tabController,
                            children: [
                              const TVShowTrendingFutureBuilder(),
                              TVShowDetailsBottom(data: data),
                              // Center(child: Text('Página 02')),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
