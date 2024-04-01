import 'package:chewie/chewie.dart';
import 'package:get/get.dart';
import 'package:Daraz/api/api_methods.dart';
import 'package:Daraz/screens/HomeScreen./HomeScreenWidgets/location_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  late Future<List<dynamic>> saleData;
  late Future<Map<String, dynamic>> productData;
   late Future<Map<String, dynamic>> myImage;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  final HomeScreen locationScreen = const HomeScreen();
  RxString livelocationmessage = 'Default live Val'.obs;   
   RxString  long = ''.obs;
    RxString lat = ''.obs;
  

  void onBottomNavigate(int index) {
    selectedIndex.value = index;
  }

  void livelocationMessage() {
    livelocationmessage =
        'Current location{ latitute = $lat and longitude = $long} '.obs;
  }

  void fetchItems() {
    ApiMethods.getItems();
    ApiMethods.getItems2();
  }

  @override
  void onInit() {
    super.onInit();
    saleData = ApiMethods.getItems();
    productData = ApiMethods.getItems2();
    myImage = ApiMethods.getItems3();

    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('https://www.youtube.com/watch?v=apedYzyc_MI'));

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoInitialize: true,
      looping: true,
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

//opens google map hitting the url
  Future<void> openMap(RxString lat, RxString long) async {
    String googleUrl =
        'https://www.google.com/maps/@${lat.value},${long.value},15z?entry=ttu';
    try {
      await launchUrl(Uri.parse(googleUrl));
    } catch (e) {
      throw Exception('Can\'t launch the url $googleUrl');
    }
  }
}
