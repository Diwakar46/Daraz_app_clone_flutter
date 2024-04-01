import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:Daraz/constants/colors.dart';
import 'package:Daraz/screens/HomeScreen./HomeScreenWidgets/ad_screen.dart';
import 'package:Daraz/screens/HomeScreen./HomeScreenWidgets/categories.dart';
import 'package:Daraz/screens/HomeScreen./HomeScreenWidgets/ad_screen_II.dart';
import 'package:Daraz/screens/HomeScreen./HomeScreenWidgets/sale_screen_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String lat;
  late String long;
  String locationMessage = 'Default Val';
  String livelocationMessage = 'Default live Val';



//opens google map hitting the url
  Future<void> openMap(String lat, String long) async {
    String googleUrl = 'https://www.google.com/maps/@$lat,$long,15z?entry=ttu';
    try {
      await launchUrl(Uri.parse(googleUrl));
    } catch (e) {
      throw Exception('Can\'t launch the url $googleUrl');
    }
  }

//getCurrentLocation
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();
    if (!serviceEnabled) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Service is Disabled Forever');
    }
    return await Geolocator.getCurrentPosition();
  }

//getting livelocation
  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.lowest,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();
    });
    setState(() {
      livelocationMessage =
          'Current location{ latitute = $lat and longitude = $long} ';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: MyColors.myGradient,
            ),
            height: sizeOfScreen.height * 0.2,
            width: double.infinity,
            child:  MyPage(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                AdScreen(),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SearchBar(
                    onTap: () {
                      getCurrentLocation().then((value) {
                        lat = '${value.latitude}';
                        long = '${value.longitude}';
                        print(' lat.value -----> $lat');
                        print(' lat.value -----> $long');
                        setState(() {
                          locationMessage = 'latitude = $lat and long = $long';
                        });
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(minutes: 1),
                          content: BottomSheet(onClosing: () {
                            Navigator.pop(context);
                          }, builder: (BuildContext context) {
                            return ElevatedButton(
                                style: const ButtonStyle(
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.black)),
                                onPressed: () {
                                  getCurrentLocation();
                                  openMap(lat, long);
                                },
                                child: const Text(
                                  'Use Google Location',
                                  style: TextStyle(color: Colors.white),
                                ));
                          })));
                    },
                    shadowColor: const MaterialStatePropertyAll(Colors.white),
                    elevation: const MaterialStatePropertyAll(3),
                    trailing: const <Widget>[Icon(Icons.flag_circle_outlined)],
                    leading: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              liveLocation();
                            },
                            icon: const Icon(
                              Icons.location_on,
                              color: Colors.redAccent,
                            )),
                      ],
                    ),
                    hintText: 'Bagmati-Province-Katmandu Metro 9',
                  ),
                ),
              ],
            ),
          ),

          // Text(locationMessage),
          // ElevatedButton(
          //     onPressed: () {
          //       getCurrentLocation().then((value) {
          //         lat = '${value.latitude}';
          //         long = '${value.longitude}';
          //         print(' lat.value -----> ${lat}');
          //         print(' lat.value -----> ${long}');
          //         setState(() {
          //           locationMessage = 'latitude = $lat and long = $long';
          //         });
          //       });
          //     },
          //     child: Icon(Icons.bubble_chart)),
          // Text(livelocationMessage)
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
            Padding(
            padding: EdgeInsets.all(8.0),
            child: SaleScreen(),
          ),
          const SizedBox(
            height: 15,
            width: double.infinity,
          ),
            Padding(
            padding: EdgeInsets.all(8.0),
            child: Categories(),
          ),
        ],
      ),
    );
  }
}
