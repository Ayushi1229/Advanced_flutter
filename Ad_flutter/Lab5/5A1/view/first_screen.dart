import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab5/5A1/controller/navigation_controller.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(onPressed: controller.goToSecondScreen, child: const Text('Go to second screen')),
      ),
    );
  }
}
