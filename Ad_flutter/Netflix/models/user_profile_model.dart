import 'base_model.dart';

class UserProfile {
  final String id;
  final String name;
  final String imageUrl;
  final bool isKids;
  final bool isAddProfile;

  UserProfile({
    required this.id,
    required this.name,
    required this.imageUrl,
    this.isKids = false,
    this.isAddProfile = false,
  });
}

class UserProfileListModel extends BaseModel {
  List<UserProfile> _profiles = [];
  UserProfile? _selectedProfile;

  List<UserProfile> get profiles => _profiles;
  UserProfile? get selectedProfile => _selectedProfile;

  UserProfileListModel() {
    _loadDefaultProfiles();
  }

  void _loadDefaultProfiles() {
    _profiles = [
      UserProfile(id: 'user1', name: 'User 1', imageUrl: 'assets/images/user1.png'),
      UserProfile(id: 'user2', name: 'User 2', imageUrl: 'assets/images/user2.png'),
      UserProfile(id: 'kids', name: 'Kids', imageUrl: 'assets/images/kids_profile.png', isKids: true),
      UserProfile(id: 'add_profile', name: 'Add Profile', imageUrl: 'assets/images/add_profile.png', isAddProfile: true),
    ];
    notifyListeners();
  }

  void selectProfile(UserProfile profile) {
    _selectedProfile = profile;
    notifyListeners();
  }


  void addNewProfile(String name, String imageUrl) {
    final newProfile = UserProfile(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      imageUrl: imageUrl,
      isAddProfile: false,
    );
    int addProfileIndex = _profiles.indexWhere((p) => p.isAddProfile);
    if (addProfileIndex != -1) {
      _profiles.insert(addProfileIndex, newProfile);
    } else {
      _profiles.add(newProfile);
    }
    notifyListeners();
  }
}