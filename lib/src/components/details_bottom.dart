import 'package:flutter/material.dart';

import '../models/movies_details_model.dart';
import 'details_bottom_row.dart';

class DetailsBottom extends StatelessWidget {
  const DetailsBottom({
    Key? key,
    required this.filmeData,
  }) : super(key: key);

  final DetailsMoviesModel? filmeData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .4,
      padding: const EdgeInsets.only(left: 20, top: 10),
      color: Colors.white.withOpacity(0.1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Ficha Técnica',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Título Original: ${filmeData!.originalTitle}',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            DetailsBottomRow(
              filmeData: filmeData,
              texto: 'Ano de Lançamento: ',
              textoFilmData: '${filmeData!.releaseDate!.year}',
            ),
            DetailsBottomRow(
              filmeData: filmeData,
              texto: 'Duração: ',
              textoFilmData: '${filmeData!.runtime} min',
            ),
            DetailsBottomRow(
              filmeData: filmeData,
              texto: 'Língua Original: ',
              textoFilmData: '${filmeData!.originalLanguage}'.toUpperCase(),
            ),
            DetailsBottomRow(
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
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}
