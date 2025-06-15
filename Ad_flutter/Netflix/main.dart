// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Netflix/views/home_view.dart';
import 'package:flutter_lab/Ad_flutter/Netflix/views/login_view.dart';
import 'package:flutter_lab/Ad_flutter/Netflix/views/who_s_watching.dart';
import 'package:provider/provider.dart';


import 'controllers/app_controller.dart';
import 'controllers/home_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/who_s_watching_controller.dart';
import 'models/app_state_model.dart';
import 'models/content_model.dart';
import 'models/login_model.dart';
import 'models/user_profile_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateModel()),
        ChangeNotifierProvider(create: (_) => LoginModel()),
        ChangeNotifierProvider(create: (_) => UserProfileListModel()),
        ChangeNotifierProvider(create: (_) => ContentListModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppController _appController;
  late LoginController _loginController;
  late WhoSWatchingController _whoSWatchingController;
  late HomeController _homeController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize controllers after models are available via Provider
    _appController = AppController(
      Provider.of<AppStateModel>(context, listen: false),
      Provider.of<UserProfileListModel>(context, listen: false),
    );
    _loginController = LoginController(
      Provider.of<LoginModel>(context, listen: false),
    );
    _whoSWatchingController = WhoSWatchingController(
      Provider.of<UserProfileListModel>(context, listen: false),
    );
    _homeController = HomeController(
      Provider.of<ContentListModel>(context, listen: false),
    );

    // Perform initial auth check
    _appController.checkInitialAuthState(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black, // Default background
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Default app bar color
          foregroundColor: Colors.white, // Default icon/text color
        ),
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white), // Default text color
        // fontFamily: 'Franklin Gothic Medium', // Uncomment if font added
      ),
      initialRoute: '/', // Starts at the login page
      routes: {
        '/': (context) => LoginView(controller: _loginController),
        '/whoswatching': (context) => WhoSWatchingView(controller: _whoSWatchingController),
        '/home': (context) => HomeView(controller: _homeController),
      },
    );
  }
}