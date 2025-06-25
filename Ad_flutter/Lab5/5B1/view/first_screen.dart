import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/navigation_controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.goToSecondScreen,
          child: const Text('Go with Animation ➡️'),
        ),
      ),
    );
  }
}
