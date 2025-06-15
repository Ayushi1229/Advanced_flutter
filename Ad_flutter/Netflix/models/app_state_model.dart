import 'base_model.dart';
import 'user_profile_model.dart';

enum AppAuthState {
  loggedOut,
  loggedIn,
  profileSelected,
}

class AppStateModel extends BaseModel {
  AppAuthState _authState = AppAuthState.loggedOut;
  UserProfile? _currentUserProfile; // Stores the currently selected profile

  AppAuthState get authState => _authState;
  UserProfile? get currentUserProfile => _currentUserProfile;

  void setAuthState(AppAuthState state) {
    _authState = state;
    notifyListeners();
  }

  void setCurrentUserProfile(UserProfile profile) {
    _currentUserProfile = profile;
    setAuthState(AppAuthState.profileSelected);
  }

  void logout() {
    _authState = AppAuthState.loggedOut;
    _currentUserProfile = null;
    notifyListeners();
  }
}