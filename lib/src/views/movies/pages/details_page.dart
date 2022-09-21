import 'package:flutter/material.dart';

import '../../../models/movies/details_model.dart';
import '../../../repository/movies_repository.dart';
import '../widgets/details_bottom.dart';
import '../widgets/details_button.dart';

class MoviesDetailsPage extends StatelessWidget {
  const MoviesDetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int? id;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DetailsMoviesModel>(
      future: MoviesRepository().fetchDetails(id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final filmeData = snapshot.data;
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://image.tmdb.org/t/p/w400${filmeData?.posterPath}',
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
                      Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(1),
                        width: 140,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w200${filmeData?.posterPath}',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          filmeData!.title.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const DetailsButtons(),
                      const SizedBox(height: 20),
                      MoviesDetailsBottom(filmeData: filmeData),
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
