import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/who_s_watching_controller.dart';
import '../models/app_state_model.dart';
import '../models/user_profile_model.dart';


class WhoSWatchingView extends StatefulWidget {
  final WhoSWatchingController controller;

  const WhoSWatchingView({Key? key, required this.controller}) : super(key: key);

  @override
  State<WhoSWatchingView> createState() => _WhoSWatchingViewState();
}

class _WhoSWatchingViewState extends State<WhoSWatchingView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Reduced duration for faster demo
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-2.0, 0.0), // Move further off-screen
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    _animationController.forward().whenComplete(() {
      setState(() {
        _showContent = true;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Loading Animation Layer
          if (!_showContent)
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                color: Colors.black,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _animatedLetter('N', 80.0),
                      _animatedLetter('E', 78.0),
                      _animatedLetter('T', 76.0),
                      _animatedLetter('F', 74.0),
                      _animatedLetter('L', 76.0),
                      _animatedLetter('I', 78.0),
                      _animatedLetter('X', 80.0),
                    ],
                  ),
                ),
              ),
            ),

          // Main Content Layer - "Who's Watching?"
          if (_showContent)
            Consumer<UserProfileListModel>(
              builder: (context, profileModel, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Text(
                        "Who's Watching?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          // fontFamily: 'Franklin Gothic Medium', // Uncomment if font added
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 50),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: profileModel.profiles.length,
                        itemBuilder: (context, index) {
                          final profile = profileModel.profiles[index];
                          return _buildProfileTile(profile, context, widget.controller);
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _animatedLetter(String letter, double fontSize) {
    return Text(
      letter,
      style: TextStyle(
        color: Colors.red,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        // fontFamily: 'Franklin Gothic Medium', // Uncomment if font added
      ),
    );
  }

  Widget _buildProfileTile(UserProfile profile, BuildContext context, WhoSWatchingController controller) {
    return GestureDetector(
      onTap: profile.isAddProfile
          ? () {
        // Handle "Add Profile" logic
        // For simplicity, let's just add a new dummy profile
        controller.model.addNewProfile('New User', 'assets/images/user1.png');
      }
          : () {
        controller.model.selectProfile(profile); // Select profile in model
        Provider.of<AppStateModel>(context, listen: false).setCurrentUserProfile(profile);
        Navigator.pushReplacementNamed(context, '/home'); // Navigate to home after selection
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              profile.imageUrl,
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            profile.name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}