// lib/controllers/app_controller.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../models/app_state_model.dart';
import '../models/user_profile_model.dart';

class AppController {
  final AppStateModel appStateModel;
  final UserProfileListModel userProfileListModel;

  AppController(this.appStateModel, this.userProfileListModel);

  // You might have methods here to initialize app, check auth status etc.
  void checkInitialAuthState(BuildContext context) {
    // For now, assume we start at login unless already logged in.
    // In a real app, you'd check persisted login state.
    if (appStateModel.authState == AppAuthState.loggedOut) {
      // Do nothing, app starts at login.
    } else if (appStateModel.authState == AppAuthState.loggedIn) {
      // If user was logged in but no profile selected, go to profile select
      Navigator.pushReplacementNamed(context, '/whoswatching');
    } else if (appStateModel.authState == AppAuthState.profileSelected) {
      // If user was logged in and profile selected, go straight to home
      Navigator.pushReplacementNamed(context, '/home');
    }
  }
}