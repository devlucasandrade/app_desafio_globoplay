import 'package:app_desafio_globoplay/src/models/tvshow/tvshow_details_model.dart';
import 'package:flutter/material.dart';

import 'tvshows_details_bottom_row.dart';

class TVShowDetailsBottom extends StatelessWidget {
  const TVShowDetailsBottom({
    Key? key,
    required this.data,
  }) : super(key: key);

  final TvShowDetailsModel? data;

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
                data: '${data!.numberOfEpisodes}',
              ),
              TVShowDetailsBottomRow(
                detailsData: data,
                texto: 'Criado por: ',
                data: '${data!.createdBy![0].name}',
              ),
              TVShowDetailsBottomRow(
                detailsData: data,
                texto: 'Ano de Lançamento: ',
                data: '${data!.firstAirDate?.year}',
              ),
              TVShowDetailsBottomRow(
                detailsData: data,
                texto: 'Gênero: ',
                data: '${data!.genres![0].name}',
              ),
              TVShowDetailsBottomRow(
                detailsData: data,
                texto: 'Plataforma: ',
                data: '${data!.networks?[0].name}',
              ),
              Text(
                'Visão Geral: ${data!.overview}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
                textAlign: TextAlign.justify,
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
