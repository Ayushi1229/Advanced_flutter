import 'package:flutter/material.dart';
import 'signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Signup MVC',
      home: SignupView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
