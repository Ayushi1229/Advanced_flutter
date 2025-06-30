import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab6/6A1/counter_controller.dart';
import 'package:get/get.dart';

class CounterView extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Non-Reactive Counter'),),
      body: Center(
        child: GetBuilder<CounterController>(
          builder: (controller){
            return Text(
              'Count: ${controller.count}',
              style: const TextStyle(fontSize:24),
            );
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: controller.increment, child: const Icon(Icons.add),),
          const SizedBox(height: 10,),
          FloatingActionButton(onPressed: controller.decrement, child: const Icon(Icons.remove),),
        ],
      ),
    );
  }
}
