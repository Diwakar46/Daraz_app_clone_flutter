import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:rest_api_flutter/api/api_methods.dart';
import 'package:rest_api_flutter/constants/colors.dart';
import 'package:rest_api_flutter/screens/Cart/cart.dart';
import 'package:rest_api_flutter/screens/HomeScreen./HomeScreenWidgets/location_screen.dart';
import 'package:rest_api_flutter/screens/Message/message.dart';
import 'package:rest_api_flutter/screens/Profile/profile.dart';
import 'package:rest_api_flutter/screens/HomeScreen./home_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<Widget> screens = [
     HomeScreen(),
    const Message(),
    const CartPage(),
    const Profile()
  ];
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return Scaffold(
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              selectedIconTheme: const IconThemeData(color: Colors.redAccent),
              // unselectedIconTheme: IconThemeData(color: Colors.orangeAccent),
              selectedLabelStyle: const TextStyle(color: Colors.black),
              // useLegacyColorScheme: false,
              enableFeedback: true,
              // elevation: 100,
              // landscapeLayout: BottomNavigationBarLandscapeLayout.centered,//when the devices is landscape

              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.onBottomNavigate(index);
              },
              items: const [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home),
                    backgroundColor: Colors.orangeAccent,
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.redAccent,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.message),
                    backgroundColor: Colors.orangeAccent,
                    icon: Icon(
                      Icons.message_outlined,
                      color: Colors.redAccent,
                    ),
                    label: 'Message'),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.shopping_cart),
                    backgroundColor: Colors.orangeAccent,
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.redAccent,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    backgroundColor: Colors.orangeAccent,
                    activeIcon: Icon(Icons.person),
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.redAccent,
                    ),
                    label: 'Profile'),
              ]),
        ),
        backgroundColor: MyColors.kscaffold,
        appBar: AppBar(
            leading: Column(
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.qr_code_scanner)),
              ],
            ),
            flexibleSpace: const FlexibleSpaceBar(
              titlePadding:
                  EdgeInsets.only(top: 30, bottom: 10, left: 50, right: 90),
              title: SearchBar(
                elevation: MaterialStatePropertyAll(1),
                hintText: 'Search',
                leading: Row(
                  children: [
                    Icon(Icons.search),
                  ],
                ),
              ),
              centerTitle: true,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.phone_android_sharp,
                ),
              ),
              IconButton(
                  color: Colors.red,
                  onPressed: () {
                    ApiMethods.getItems2();
                    ApiMethods.getItems();
                  },
                  icon: const Icon(
                    Icons.diamond,
                    color: Colors.purple,
                  ))
            ]),
        body: Obx(() => screens[controller.selectedIndex.value]));
  }
}
