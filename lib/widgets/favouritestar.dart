import 'package:flutter/material.dart';

class FavouriteStar extends StatefulWidget {
  const FavouriteStar({super.key});

  @override
  State<FavouriteStar> createState() => _FavouriteStar();
}


 


class _FavouriteStar extends State<FavouriteStar> {
  bool isFavorited = false;
  int favoriteCount = 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: FavStar,
      icon: (isFavorited ? const Icon(Icons.star) : const Icon(Icons.star_border)),
      color: Colors.purple,
    );
  }

  void FavStar() {
    setState(() {
      if (isFavorited) {
        favoriteCount -= 1;
        isFavorited = false;
      } else {
        favoriteCount += 1;
        isFavorited = true;
      }
    });
  }

}
