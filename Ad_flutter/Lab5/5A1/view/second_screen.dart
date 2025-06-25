import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab5/5A1/controller/navigation_controller.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("Second Screen")),
      body: Center(
        child: ElevatedButton(onPressed: controller.goBack, child: const Text('Go back to previous screen')),
      ),
    );
  }
}
