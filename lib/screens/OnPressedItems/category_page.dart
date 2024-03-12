import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/constants/colors.dart';
import 'package:rest_api_flutter/screens/HomeScreen./home_controller.dart';

class CategoryPage extends StatelessWidget {
  final String? title;
  final String? mainImage;
  final String? tag;
  final int? productId;
  List<dynamic>? otherRelatedImages;
  final String? price;

  CategoryPage(
      {Key? key,
      this.title,
      this.mainImage,
      this.tag,
      this.otherRelatedImages,
      this.productId,this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    Future<Map<String, dynamic>> product = controller.productData;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: tag!,
              child: Material(
                child: Container(
                  height: 360,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(mainImage!), fit: BoxFit.cover)),
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
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
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
                                    duration: Duration(milliseconds: 1200),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1200),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                                FadeInUp(
                                    duration: Duration(milliseconds: 1300),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    )),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        FadeInUp(
                            duration: Duration(milliseconds: 1200),
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
              ),
            ), //------------------------------------
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "New Product",
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
                        } else if (snapshot.hasData) {
                          return Container(
                            height: 400,
                            width: 500,
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
                                itemCount:min(3,  otherRelatedImages!.length,),
                                itemBuilder: (context, index) {
                                  // return Text(otherRelatedImages![index].toString());
                                  //the first index => is the product all images
                                  return makeProduct(context,
                                      image: otherRelatedImages![index][index]
                                          .toString(),
                                      title: title.toString(),
                                      price: price.toString());
                                }),
                          );
                        } else {
                          return const Center(
                            child: Text('Error while fetching data'),
                          );
                        }
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget makeProduct(BuildContext context, {image, title, price}) {
    Size sizeofScreen = MediaQuery.of(context).size;
    return Container(
      color: Colors.amber,
      padding: EdgeInsets.all(60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.network(image),
          FadeInUp(
              duration: Duration(milliseconds: 1400),
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
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: Text(
                        price,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              FadeInUp(
                  duration: Duration(milliseconds: 2000),
                  child: Container(
                      width: 40,
                      height: 40,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_shopping_cart),
                          color: Colors.grey[700],
                        ),
                      )))
            ],
          ),
        ],
      ),
    );
  }
}
