import 'package:Daraz/screens/Cart/cart_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Daraz/constants/colors.dart';
import 'package:Daraz/screens/HomeScreen./home_controller.dart';
import 'package:Daraz/screens/OnPressedItems/category_page_controller.dart';
import 'package:Daraz/widgets/mycarouselslider.dart';

class CategoryPage extends StatelessWidget {
  final String? title;
  final String? mainImage;
  final String? tag;
  final int? productId;
  final List<dynamic>? otherRelatedImages;
  final String? price;

  CategoryPage(
      {super.key,
      this.title,
      this.mainImage,
      this.tag,
      this.otherRelatedImages,
      this.productId,
      this.price});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    final CartController cartController = Get.put(CartController());
    Future<Map<String, dynamic>> product = controller.productData;
    final CategoryPageController categoryPageController =
        Get.put(CategoryPageController());

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 13,
          selectedFontSize: 13,
          selectedLabelStyle: TextStyle(color: MyColors.kblack),
          unselectedLabelStyle: TextStyle(color: MyColors.kblack),
          type: BottomNavigationBarType.fixed,
          items: [
            const BottomNavigationBarItem(
                label: 'Shop',
                icon: Icon(
                  Icons.shop,
                  color: Colors.red,
                )),
            const BottomNavigationBarItem(
                label: 'Chat',
                icon: Icon(
                  Icons.chat,
                  color: Colors.red,
                )),
            BottomNavigationBarItem(
                label: '',
                icon: InkWell(
                  child: Container(
                    child: Center(
                        child: Text(
                      'Buy Now',
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange),
                    height: 40,
                    width: 80,
                  ),
                )),
            BottomNavigationBarItem(
                label: '',
                icon: InkWell(
                  onTap: () {
                    Get.snackbar(
                        borderRadius: 2,
                        duration: Duration(seconds: 1),
                        snackPosition: SnackPosition.BOTTOM,
                        colorText: Colors.white,
                        backgroundColor: Colors.transparent.withAlpha(150),
                        'Added to Cart Sucessfully!',
                        '');
                    cartController.addToCart();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 15),
                    child: Center(
                        child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
                    )),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red.withOpacity(0.9)),
                    height: 40,
                    width: 110,
                  ),
                ))
          ]),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
                tag: tag!,
                child: Material(
                    child: Obx(
                  () => Container(
                    height: 360,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                (categoryPageController.imageChanged.value)
                                    ? categoryPageController.newMainImage.value
                                    : mainImage!),
                            fit: BoxFit.cover)),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.1),
                          ])),
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  FadeInUp(
                                      duration: const Duration(milliseconds: 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.search,
                                          color: MyColors.kprimary2,
                                        ),
                                        onPressed: () {},
                                      )),
                                  FadeInUp(
                                      duration: const Duration(milliseconds: 0),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      )),
                                  FadeInUp(
                                      duration: const Duration(milliseconds: 0),
                                      child: IconButton(
                                        icon: Badge(
                                          label: GetBuilder<CartController>(
                                            builder: (cartController) {
                                              return Text(
                                                  '${cartController.cartItems.value}');
                                            }
                                          ),
                                          child: const Icon(
                                            Icons.add_shopping_cart_outlined,
                                            color: MyColors.kprimary2,
                                          ),
                                        ),
                                        onPressed: () {},
                                      )),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: Text(
                                title!,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ))
                        ],
                      ),
                    ),
                  ),
                ))),
            //------------------------------------
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Similar Images",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "View More",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 11,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<Map<String, dynamic>>(
                      future: product,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: MyColors.kcircularProgressIndicator,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return MyCarouselSlider(
                            image: 'assets/images/default-product-image.png',
                          );
                        } else if (snapshot.hasData) {
                          return Column(children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                padEnds: false,
                                enableInfiniteScroll: false,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                enlargeFactor: 1,
                                viewportFraction: 0.24,
                                height: 120.0,
                              ),
                              items: otherRelatedImages!.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return InkWell(
                                      splashColor: Colors.amber,
                                      onTap: () {
                                        print('$i');
                                        //sending image value to getx class avoiding setState() i.e stateful
                                        categoryPageController
                                            .changeMainImage(i);
                                        print(
                                            'New main Image ${categoryPageController.newMainImage}');

                                        //change the dots
                                      },
                                      child: Container(
                                          margin: const EdgeInsets.only(
                                              bottom: 5, top: 5, right: 5),
                                          width: 400,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: MyColors.kred),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: Image.network('$i'),
                                          )),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                            // Container(
                            //   margin: EdgeInsets.only(left: 100),
                            //   height: 15,
                            //   width: double.infinity,
                            //   child: ListView.builder(
                            //       scrollDirection: Axis.horizontal,
                            //       itemCount: otherRelatedImages!.length,
                            //       itemBuilder: (context, index) {

                            //           print('$index');
                            //           return Container(
                            //             height: 20,
                            //             width: 30,
                            //             decoration: BoxDecoration(
                            //               border:
                            //                   Border.all(color: Colors.orange),
                            //               shape: BoxShape.circle,
                            //               color: (index == index)
                            //                   ? Colors.orange
                            //                   : Colors.white,
                            //             ),
                            //           );

                            //       }),
                            // ),
                          ]);
                        } else {
                          return const Center(
                            child: Text('Error while fetching data'),
                          );
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget makeProduct(BuildContext context, {image, title, price}) {
    Size sizeofScreen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [MyColors.kprimary, Colors.orange])),
      padding: const EdgeInsets.all(80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(image),
          FadeInUp(
              duration: const Duration(milliseconds: 1400),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        title,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        price,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
