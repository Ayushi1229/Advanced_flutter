import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String data = Get.arguments['username']??'No name passed';

    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Text(
          'Hello, $data !!',
          style: const TextStyle(fontSize: 26.0),
        ),
      ),
    );
  }
}
