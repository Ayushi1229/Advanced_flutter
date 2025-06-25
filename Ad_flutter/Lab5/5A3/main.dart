import 'package:flutter/cupertino.dart';
import 'package:flutter_lab/Ad_flutter/Lab5/5A3/view/second_screen.dart';
import 'package:flutter_lab/Ad_flutter/Lab5/5A3/view/first_screen.dart';
import 'package:get/get.dart';
void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Named Route Navigation',
      debugShowCheckedModeBanner: false,
      initialRoute: '/first',
      getPages: [
        GetPage(name: '/first', page: ()=> FirstScreen()),
        GetPage(name: '/second', page: () => SecondScreen())
      ],
    );
  }
}
