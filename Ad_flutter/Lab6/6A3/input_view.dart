import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab6/6A3/input_controller.dart';
import 'package:get/get.dart';

class InputView extends StatelessWidget {
  final InputController controller = Get.put(InputController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RxString with TextField"),),
      body: Padding(padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Enter your name"),
            onChanged: controller.updateName,
          ),
          const SizedBox(height: 20),
          Obx(()=>Text(
            'You typed: ${controller.name}',
            style: const TextStyle(fontSize: 24),
          ))
        ],
      )),
    );
  }
}
