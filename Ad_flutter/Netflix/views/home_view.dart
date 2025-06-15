// lib/views/home_view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/home_controller.dart';
import '../models/app_state_model.dart';
import '../models/content_model.dart';
import '../models/user_profile_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'components/content_carousel.dart'; // For launching video URLs

class HomeView extends StatelessWidget {
  final HomeController controller;

  const HomeView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appStateModel = Provider.of<AppStateModel>(context);
    final UserProfile? currentUser = appStateModel.currentUserProfile;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer<ContentListModel>(
        builder: (context, contentModel, child) {
          if (contentModel.isLoadingContent) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.red),
            );
          }
          if (contentModel.contentErrorMessage != null) {
            return Center(
              child: Text(
                'Error: ${contentModel.contentErrorMessage}',
                style: const TextStyle(color: Colors.white),
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              // AppBar-like section
              SliverAppBar(
                backgroundColor: Colors.black.withOpacity(0.8),
                expandedHeight: 400.0, // Height for the main movie image
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      // Main Money Heist Image
                      Positioned.fill(
                        child: Image.asset(
                          'assets/images/money_heist.png', // Main image
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter, // Align to top
                        ),
                      ),
                      // Gradient overlay for better text visibility
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black],
                            ),
                          ),
                        ),
                      ),
                      // Top header elements
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 10, // Account for safe area
                        left: 10,
                        right: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Menu Button
                            IconButton(
                              icon: Image.asset('assets/images/menu.png', height: 25, width: 25, color: Colors.white),
                              onPressed: () {
                                // Handle menu drawer
                              },
                            ),
                            // Netflix Logo
                            Image.asset('assets/images/netflix_logo.png', height: 30), // A smaller Netflix logo if available
                            Row(
                              children: [
                                // Search Button
                                IconButton(
                                  icon: Image.asset('assets/images/search.png', height: 25, width: 25, color: Colors.white),
                                  onPressed: () {
                                    // Handle search
                                  },
                                ),
                                // More Options Button
                                IconButton(
                                  icon: Image.asset('assets/images/dots.png', height: 25, width: 25, color: Colors.white),
                                  onPressed: () {
                                    // Handle more options
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Play and My List buttons
                      Positioned(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  controller.model.playContent('https://www.netflix.com/watch/80205342'); // Hardcoded for Money Heist
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                                icon: Image.asset('assets/images/play.png', height: 20, width: 20, color: Colors.black),
                                label: const Text('Play', style: TextStyle(fontSize: 16)),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  // Add to My List logic
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade700,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                ),
                                icon: Image.asset('assets/images/mylist.png', height: 20, width: 20, color: Colors.white),
                                label: const Text('My List', style: TextStyle(fontSize: 16)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content Rows
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    if (currentUser != null)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Watching as: ${currentUser.name}', // Display current profile
                          style: const TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                      child: Text(
                        "We Think You'll Like These",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ContentCarousel(contentItems: contentModel.weThinkYoullLike, controller: controller),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                      child: Text(
                        "Indian Movies",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ContentCarousel(contentItems: contentModel.indianMovies, controller: controller),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(16.0, 20.0, 16.0, 10.0),
                      child: Text(
                        "Only on Netflix",
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ContentCarousel(contentItems: contentModel.onlyOnNetflix, controller: controller),
                    const SizedBox(height: 50), // Padding at the bottom
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}