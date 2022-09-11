import 'dart:ui';

import 'package:app_desafio_globo/src/models/tmdb_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.id,
    required this.index,
  }) : super(key: key);
  final TmdbModel id;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                'https://image.tmdb.org/t/p/w400/${id.results![index].posterPath}',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                id.results![index].originalTitle.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              id.results![index].mediaType.toString().capitalize(),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              id.results![index].overview.toString().capitalize(),
              style: const TextStyle(
                color: Colors.white,
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
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
