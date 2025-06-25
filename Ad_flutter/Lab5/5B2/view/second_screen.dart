import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController controller = Get.find();
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.goBack,
          child: const Text('⬅️ Go Back'),
        ),
      ),
    );
  }
}
