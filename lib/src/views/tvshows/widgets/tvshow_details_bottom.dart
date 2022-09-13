import 'package:app_desafio_globoplay/src/models/tvshow/tvshow_details_model.dart';
import 'package:flutter/material.dart';

import 'tvshow_details_bottom_row.dart';

class TVShowDetailsBottom extends StatelessWidget {
  const TVShowDetailsBottom({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TvShowDetailsModel? data;

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
              'Título Original: ${data!.name}',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            TVShowDetailsBottomRow(
              detailsData: data,
              texto: 'Temporadas: ',
              data: '${data!.numberOfSeasons}',
            ),
            TVShowDetailsBottomRow(
              detailsData: data,
              texto: 'Episódios: ',
              data: '${data!.numberOfEpisodes} min',
            ),
            TVShowDetailsBottomRow(
              detailsData: data,
              texto: 'Língua Original: ',
              data: '${data!.originalLanguage}'.toUpperCase(),
            ),
            Text(
              'Visão Geral: ${data!.overview}',
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
