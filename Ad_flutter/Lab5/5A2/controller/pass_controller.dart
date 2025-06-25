import 'package:flutter_lab/Ad_flutter/Lab5/5A2/view/second_screen.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController{
  void goToSecondScreenWithData(String data){
    Get.to(()=> const SecondScreen(),arguments: {'username': data});
  }
}