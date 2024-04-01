import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class CategoryPageController extends GetxController {
  RxDouble myIndex = 0.0.obs;
  RxString newMainImage = ''.obs;
  RxBool imageChanged = false.obs;
  RxBool dotChanged = false.obs;

  void sliderFunction(double index) {
    myIndex.value = index;
  }

  void changeMainImage(String image) {
    newMainImage.value = image;
    imageChanged.value = true;
  }

  void changeDotColor(bool changeDotColor) {
    dotChanged.value = changeDotColor;
  }
}
