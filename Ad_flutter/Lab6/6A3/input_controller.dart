import 'package:get/get.dart';

class InputController extends GetxController{

  var name = ''.obs;
  void updateName(String value){
    name.value = value;
  }
}