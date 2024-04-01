import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Daraz/constants/colors.dart';
import 'package:Daraz/screens/HomeScreen./home_controller.dart';
import 'package:Daraz/screens/OnPressedItems/category_page.dart';

class Categories extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: MyColors.kwhite, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      height: screenSize.height * 0.60,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                right: 8,
                left: 8,
              ),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 7, left: 8, right: 8),
              child: Text(
                'Inspired by your interests',
                style: TextStyle(color: MyColors.kgrey),
              ),
            ),
            FutureBuilder<Map<String, dynamic>>(
                future: controller.productData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                      height: 180,
                      child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 100,
                              width: 40,
                              decoration: BoxDecoration(
                                  gradient: MyColors.productbgGradient),
                              margin: const EdgeInsets.all(4),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child:
                          Text('Try again: Turn on your Internet Connection'),
                    );
                  } else if (snapshot.hasData) {
                    Map<String, dynamic> data = snapshot.data!;
                    List<dynamic> products = data['products'];
                    return SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                                height: 200,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      List<dynamic>
                                          allImagesinApiofaSingleProduct =
                                          products[index]['images'];
                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, right: 20),
                                            child: InkWell(
                                              onTap: () {
                                                Get.to(CategoryPage(
                                                  otherRelatedImages:
                                                      allImagesinApiofaSingleProduct //mistake --> [allImagesinApiofaSingleProduct]
                                                  ,
                                                  productId: products[index]
                                                      ['id'],
                                                  mainImage:
                                                      '${products[index]['thumbnail']}',
                                                  title:
                                                      '${products[index]['title']}',
                                                  tag: 'tag',
                                                  price:
                                                      " ${products[index]['price']}",
                                                ));
                                              },
                                              child: Container(
                                                height: 180,
                                                width: 100,
                                                color: Colors.grey
                                                    .withOpacity(0.15),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 4,
                                                              left: 8,
                                                              bottom: 0,
                                                              right: 0),
                                                      child: Image.network(
                                                          fit: BoxFit.scaleDown,
                                                          '${products[index]['thumbnail']}'),
                                                    ),
                                                    const Text(
                                                      'Brand',
                                                      style: TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                    Text(
                                                      '${products[index]['brand']}',
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    })),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                height: 190,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    itemBuilder: (context, index) {
                                      List<dynamic>
                                          allImagesinApiofaSingleProduct =
                                          products[index]['images'];
                                      // https://cdn.dummyjson.com/product-images/1/1.jpg = imageNozero

                                      return Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8, right: 8),
                                            child: Container(
                                              height: 170,
                                              width: 100,
                                              color:
                                                  Colors.grey.withOpacity(0.15),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    print(
                                                        allImagesinApiofaSingleProduct);
                                                    Get.to(CategoryPage(
                                                      otherRelatedImages:
                                                          allImagesinApiofaSingleProduct,
                                                      productId: products[index]
                                                          ['id'],
                                                      mainImage:
                                                          '${products[index]['images'][0]}',
                                                      title:
                                                          '${products[index]['title']}',
                                                      tag: 'tag',
                                                      price:
                                                          " ${products[index]['price']}",
                                                    ));
                                                  },
                                                  child: Image.network(
                                                      '${products[index]['images'][0]}'),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${products[index]['category']}',
                                            style: const TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      );
                                    })),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: Text('No data available'),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
