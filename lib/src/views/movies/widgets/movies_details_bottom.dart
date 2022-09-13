import 'package:flutter/material.dart';

import '../../../models/movies/movies_details_model.dart';
import 'movies_details_bottom_row.dart';

class MoviesDetailsBottom extends StatelessWidget {
  const MoviesDetailsBottom({
    Key? key,
    required this.filmeData,
  }) : super(key: key);

  final DetailsMoviesModel? filmeData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 10),
        color: Colors.white.withOpacity(0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Título Original: ${filmeData!.originalTitle}',
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              MoviesDetailsBottomRow(
                filmeData: filmeData,
                texto: 'Ano de Lançamento: ',
                textoFilmData: '${filmeData!.releaseDate!.year}',
              ),
              MoviesDetailsBottomRow(
                filmeData: filmeData,
                texto: 'Duração: ',
                textoFilmData: '${filmeData!.runtime} min',
              ),
              MoviesDetailsBottomRow(
                filmeData: filmeData,
                texto: 'Língua Original: ',
                textoFilmData: '${filmeData!.originalLanguage}'.toUpperCase(),
              ),
              MoviesDetailsBottomRow(
                filmeData: filmeData,
                texto: 'Gênero: ',
                textoFilmData: '${filmeData?.genres?[0].name}',
              ),
              Text(
                'Visão Geral: ${filmeData!.overview}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
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
