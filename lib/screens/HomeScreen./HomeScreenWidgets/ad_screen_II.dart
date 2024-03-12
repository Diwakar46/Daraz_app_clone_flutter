import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
   MyPage({super.key});

  final List<String> myImages = [
    'assets/images/daraz1.jpg',
    'assets/images/daraz2.jpg',
    'assets/images/daraz3.jpg',
    'assets/images/daraz4.jpg',
    'assets/images/daraz5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(itemCount: myImages.length,itemBuilder: (context, index) {
      return PageView(
        children: [
          Image.asset(myImages[index])
          
        ],
      );
    });
  }
}
