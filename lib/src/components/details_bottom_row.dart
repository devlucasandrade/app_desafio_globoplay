import 'package:flutter/material.dart';

import '../models/movies_details_model.dart';

class DetailsBottomRow extends StatelessWidget {
  const DetailsBottomRow({
    Key? key,
    required this.filmeData,
    required this.texto,
    required this.textoFilmData,
  }) : super(key: key);

  final DetailsMoviesModel? filmeData;
  final String texto;
  final String textoFilmData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              texto,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              textoFilmData,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
