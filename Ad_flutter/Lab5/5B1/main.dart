import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/first_screen.dart';
import 'view/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Animated Transitions',
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      getPages: [
        GetPage(
          name: '/first',
          page: () => FirstScreen(),
        ),
        GetPage(
          name: '/second',
          page: () => const SecondScreen(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 600),
        ),
      ],
    );
  }
}
