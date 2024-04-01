import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Daraz/constants/colors.dart';
import 'package:Daraz/screens/HomeScreen./home_controller.dart';

class AdScreen extends StatelessWidget {
  AdScreen({super.key});
  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: MyColors.myGradient,
      ),
      height: screenSize.height * 0.23,
      width: double.infinity,
      child: Chewie(
        controller: _controller.chewieController,
      ),
    );
  }
}
