import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'profile_model.dart';

class ProfileCard extends StatelessWidget {
  final ProfileModel profile;

  const ProfileCard({super.key, required this.profile});

  String getInitial(String? name) {
    if (name == null || name.trim().isEmpty) return '?';
    return name.trim()[0].toUpperCase();
  }

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile Card',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background wave
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // Card content
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView( // Added SingleChildScrollView
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Main card
                    Container(
                      margin: const EdgeInsets.only(top: 90),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              profile.name ?? 'No Name',
                              style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              profile.email ?? 'N/A',
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 16),
                            const Divider(thickness: 1.2),
                            const SizedBox(height: 8),

                            // New Row for details and QR Code
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      _infoTile(Icons.cake, 'Age', profile.age ?? '-'),
                                      _infoTile(Icons.location_city, 'City', profile.city ?? '-'),
                                      _infoTile(Icons.phone, 'Phone', profile.number ?? '-'),
                                      _infoTile(Icons.person, 'Gender', profile.gender ?? '-'),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  children: [
                                    QrImageView(
                                      data: profile.email ?? 'No Data',
                                      version: QrVersions.auto,
                                      size: 80.0, // Increased QR code size
                                    ),
                                    const Text(
                                      'Scan for contact info',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 12, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Social Media Row - Moved here for better visibility
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _socialIcon(
                                  'https://img.icons8.com/ios-filled/50/000000/instagram-new.png',
                                      () => _launchURL('https://www.instagram.com/?hl=en'),
                                ),
                                const SizedBox(width: 16),
                                _socialIcon(
                                  'https://img.icons8.com/ios-glyphs/50/000000/github.png',
                                      () => _launchURL('https://github.com/Ayushi1229'),
                                ),
                                const SizedBox(width: 16),
                                _socialIcon(
                                  'https://img.icons8.com/ios-filled/50/000000/linkedin.png',
                                      () => _launchURL('https://www.linkedin.com/feed/'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Avatar with Initial
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Colors.white, Colors.lightBlueAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          getInitial(profile.name),
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 20),
          const SizedBox(width: 12),
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialIcon(String imageUrl, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 22,
        child: Image.network(imageUrl, height: 24, width: 24),
      ),
    );
  }
}