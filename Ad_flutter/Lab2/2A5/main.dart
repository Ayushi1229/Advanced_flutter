import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A5/controllers/home_controller.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A5/views/home_screen.dart';
import 'package:provider/provider.dart';

import 'app_data_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppDataModel>(
          create: (_) => AppDataModel(),
        ),
        ChangeNotifierProxyProvider<AppDataModel, HomeController>(
          create: (context) => HomeController(
            appDataModel: Provider.of<AppDataModel>(context, listen: false),
          ),
          update: (_, appDataModel, homeController) =>
          homeController!..updateAppDataModel(appDataModel),
        ),
      ],
      child: MaterialApp(
        title: 'Streaming App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            elevation: 0,
          ),
          textTheme: TextTheme(
            bodyLarge: const TextStyle(color: Colors.white),
            bodyMedium: const TextStyle(color: Colors.white),
            titleLarge: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            titleMedium: const TextStyle(color: Colors.white),
            labelLarge: const TextStyle(color: Colors.white),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.red,
            textTheme: ButtonTextTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Colors.white54, width: 1.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
