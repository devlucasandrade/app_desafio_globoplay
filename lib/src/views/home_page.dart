import 'package:app_desafio_globo/src/models/tmdb_model.dart';
import 'package:app_desafio_globo/src/repository/tmdb_repository.dart';
import 'package:app_desafio_globo/src/views/detail_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('globloplay'),
        centerTitle: true,
      ),
      body: FutureBuilder<TmdbModel>(
        future: TmdbRepository().getFilmes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final filmesData = snapshot.data;
            return Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 20),
              /*
            --> Cria lista na vertical
            */
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            filmesData!.name.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 200,
                        /*
                      --> Cria a lista na horizontal
                      */
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: filmesData.results?.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailPage(
                                      id: filmesData,
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w400/${filmesData.results![index].posterPath}',
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
