import 'package:get/get.dart';

class NavigationController extends GetxController {
  void goToSecondScreen() {
    Get.toNamed('/second');
  }

  void goBack() {
    Get.back();
  }
}
