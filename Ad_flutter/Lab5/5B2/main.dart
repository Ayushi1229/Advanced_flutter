import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab5/5B2/middleware.dart';
import 'package:get/get.dart';
import '../5B2/view/second_screen.dart';
import '../5B2/view/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
          middlewares: [CustomMiddleware()],
        ),
      ],
    );
  }
}
