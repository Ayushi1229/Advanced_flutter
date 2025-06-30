import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab6/6A2/controller.dart';
import 'package:get/get.dart';

class CounterView extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reactive Counter (Rx/Obx)')),
      body: Center(
        child: Obx(() => Text(
          'Count: ${controller.count}',
          style: const TextStyle(fontSize: 26),
        )),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'inc',
            onPressed: controller.increment,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: 'dec',
            onPressed: controller.decrement,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
