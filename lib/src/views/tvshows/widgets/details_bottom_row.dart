import 'package:app_desafio_globoplay/src/models/tvshow/details_model.dart';
import 'package:flutter/material.dart';

class TVShowDetailsBottomRow extends StatelessWidget {
  const TVShowDetailsBottomRow({
    Key? key,
    required this.detailsData,
    required this.texto,
    required this.data,
  }) : super(key: key);

  final TvShowDetailsModel? detailsData;
  final String texto;
  final String data;

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
              data,
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
