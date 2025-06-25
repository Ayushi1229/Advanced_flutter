import 'package:flutter_lab/Ad_flutter/Lab5/5A1/view/second_screen.dart';
import 'package:get/get.dart';


class NavigationController extends GetxController{
  void goToSecondScreen(){
    Get.to(()=> SecondScreen());
  }
  void goBack(){
    Get.back();
  }
}