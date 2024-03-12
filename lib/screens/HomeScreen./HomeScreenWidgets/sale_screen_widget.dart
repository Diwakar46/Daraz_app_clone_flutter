import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api_flutter/constants/colors.dart';
import 'package:rest_api_flutter/screens/HomeScreen./home_controller.dart';

class SaleScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: MyColors.kwhite, borderRadius: BorderRadius.circular(15)),
      width: double.infinity,
      height: screenSize.height * 0.40,
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
                  'Flash Sale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 7, left: 8, right: 8),
            child: Text(
              'Get them before they\'re gone',
              style: TextStyle(color: MyColors.kgrey),
            ),
          ),
          FutureBuilder<List<dynamic>>(
              future: controller.saleData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 190,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        itemCount: 30,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 140,
                            width: 40,
                            decoration: BoxDecoration(
                                gradient: MyColors.productbgGradient),
                            margin: const EdgeInsets.all(4),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  List<dynamic>? data = snapshot.data;
                  return SizedBox(
                    height: 240,
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 1, left: 5),
                        scrollDirection: Axis.horizontal,
                        itemCount: data!.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.15)),
                            margin: const EdgeInsets.only(
                                top: 1, bottom: 4, right: 8, left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    height: 150,
                                    width: 120,
                                    child: Image.network(
                                        '${data[index]['image']}')),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        const TextSpan(
                                          text:
                                              '\$ ', // '$' sign in orange color
                                          style: TextStyle(
                                              color: Colors.orange,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(
                                          text:
                                              '${data[index]['price']}', // '100' in red color
                                          style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    const Icon(
                                      Icons.star_border,
                                      color: Colors.red,
                                      size: 15,
                                    ),
                                    Text(
                                      '${data[index]['rating']['rate']}',
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, left: 5, bottom: 0),
                                        child: Text(
                                          '${data[index]['rating']['count']} SOLD',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 23,
                                      width: 9,
                                      child: IconButton(
                                          onPressed: () {
                                            Get.snackbar(
                                                'Item Sucessfully added on the Cart',
                                                '${data[index]['']}');
                                          },
                                          icon: const Icon(
                                              Icons.shopping_cart_rounded)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(
                    child: Text('No data available'),
                  );
                }
              })
        ],
      ),
    );
  }
}
