import 'package:flutter_lab/Ad_flutter/Lab6/6A1/counter_model.dart';
import 'package:get/get.dart';


class CounterController extends GetxController{
  CounterModel counter = CounterModel(count:0);

  void increment(){
    counter.count++;
    update();
  }

  void decrement(){
    counter.count--;
    update();
  }
  int get count => counter.count;
}