import 'package:flutter/material.dart';

class DetailsBottomRow extends StatelessWidget {
  const DetailsBottomRow({
    Key? key,
    required this.texto,
    required this.textoModel,
  }) : super(key: key);

  final String texto;
  final String textoModel;

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
              textoModel,
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
