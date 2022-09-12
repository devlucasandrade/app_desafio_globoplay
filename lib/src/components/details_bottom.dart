import 'package:flutter/material.dart';

import '../models/movies_model.dart';
import 'details_bottom_row.dart';

class DetailsBottom extends StatelessWidget {
  const DetailsBottom({
    Key? key,
    required this.moviesModel,
    required this.index,
  }) : super(key: key);

  final int index;
  final MoviesModel moviesModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height * .3,
        padding: const EdgeInsets.only(left: 20, top: 20),
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Ficha Técnica',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            DetailsBottomRow(
              texto: 'Título Original: ',
              textoModel: '${moviesModel.originalTitle}',
            ),
            // DetailsBottomRow(
            //   texto: 'Título Original: ',
            //   textoModel: '${moviesModel.results![index].originalTitle}',
            // ),
            // DetailsBottomRow(
            //   texto: 'Ano de lançamento: ',
            //   textoModel: '${moviesModel.results![index].releaseDate?.year}',
            // ),
          ],
        ),
      ),
    );
  }
}
