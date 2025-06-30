import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'timer_controller.dart';
import 'timer_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TimerModel model = TimerModel(initialSeconds: 10); // Countdown from 10
  final TimerController controller = Get.put(TimerController(TimerModel(initialSeconds: 10)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Countdown Timer')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(
                'Time Left: ${controller.remainingSeconds}',
                style: TextStyle(fontSize: 30),
              )),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.startTimer,
                child: Text('Start'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: controller.stopTimer,
                child: Text('Stop'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
