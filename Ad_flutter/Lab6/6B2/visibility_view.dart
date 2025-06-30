import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'visibility_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final VisibilityController controller = Get.put(VisibilityController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RxBool Visibility',
      home: Scaffold(
        appBar: AppBar(title: Text('RxBool Show/Hide Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => controller.isVisible.value
                  ? Text('This content is visible', style: TextStyle(fontSize: 20))
                  : SizedBox.shrink()),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: controller.toggleVisibility,
                child: Obx(() => Text(controller.isVisible.value ? 'Hide' : 'Show')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
