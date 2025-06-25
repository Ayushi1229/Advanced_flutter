import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../5A2/controller/pass_controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final NavigationController controller = Get.put(NavigationController());
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Enter your name'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: (){
                    final data = nameController.text.trim();
                    if(data.isNotEmpty){
                      controller.goToSecondScreenWithData(data);
                    }
                  }, child: const Text('Go to second screen'))
            ],
          ),

      ),
    );
  }
}
