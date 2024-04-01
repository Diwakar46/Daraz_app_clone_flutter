// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatelessWidget {
  final String? image;

  MyCarouselSlider({
    Key? key,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        options: CarouselOptions(
          padEnds: false,
          enableInfiniteScroll: false,
          enlargeStrategy: CenterPageEnlargeStrategy.scale,
          enlargeFactor: 1,
          viewportFraction: 0.24,
          height: 130.0,
        ),
        items: [
          Container(
              margin: const EdgeInsets.only(bottom: 5, top: 5, right: 5),
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Image.asset('$image'),
              )),
        ]);
  }
}
