import 'package:flutter/material.dart';
import 'user_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite List MVC',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const UserView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
