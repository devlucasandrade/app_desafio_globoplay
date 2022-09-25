import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/favorites_provider.dart';

class TVShowButtons extends StatelessWidget {
  const TVShowButtons({
    Key? key,
    this.posterPath,
    this.id,
  }) : super(key: key);
  final String? posterPath;
  final int? id;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavoritesProvider>(context);

    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
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
              foregroundColor: Colors.black,
              side: const BorderSide(
                width: 1,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              provider.toggleFavoriteMovie(id!, posterPath!);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  provider.ifExist(id!)
                      ? const Icon(Icons.check, size: 20, color: Colors.white)
                      : const Icon(Icons.star, size: 20, color: Colors.white),
                  const SizedBox(width: 10),
                  const Text(
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
    );
  }
}
