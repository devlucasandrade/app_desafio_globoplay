import 'package:app_desafio_globo/src/models/movies_model.dart';
import 'package:flutter/material.dart';

import '../components/details_bottom.dart';
import '../models/list_movies_model.dart';
import '../repository/movies_repository.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.index,
    required this.id,
  }) : super(key: key);
  final ListMoviesModel id;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MoviesModel>(
      future: MoviesRepository().getFilme(id.results?[index].id),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          final filmeData = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black.withOpacity(0.0),
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    width: 120,
                    child: Image.network(
                      'https://image.tmdb.org/t/p/w400/${filmeData?.posterPath}',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      filmeData!.originalTitle.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.play_arrow,
                                  size: 35,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Assista',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.black,
                            side: const BorderSide(
                              width: 0.5,
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 13),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.star,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Minha Lista',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              child: SingleChildScrollView(
                child: DetailsBottom(
                  filmeData: filmeData,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
