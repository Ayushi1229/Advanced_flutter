import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A5/controllers/home_controller.dart';
import 'package:provider/provider.dart';

import 'content_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, controller, child) {
        final featured = controller.featuredContent;

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                print('Menu tapped');
              },
            ),
            title: const Text(
              'NETFLIX',
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  print('Search tapped');
                },
              ),
              IconButton(
                icon: const Icon(Icons.person, color: Colors.white),
                onPressed: () {
                  print('Profile tapped');
                },
              ),
            ],
          ),
          body: featured == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFeaturedContent(context, controller),
                const SizedBox(height: 20),
                ContentSection(
                  title: 'New this week',
                  contentList: controller.newThisWeek,
                  onContentTap: controller.onContentCardTap,
                ),
                ContentSection(
                  title: 'Trending Now',
                  contentList: controller.trendingNow,
                  onContentTap: controller.onContentCardTap,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          bottomNavigationBar: _buildBottomNavBar(),
        );
      },
    );
  }

  Widget _buildFeaturedContent(BuildContext context, HomeController controller) {
    final featured = controller.featuredContent;

    return Stack(
      children: [
        ShaderMask(
          shaderCallback: (rect) {
            return const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.transparent, Colors.black],
            ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
          },
          blendMode: BlendMode.dstIn,
          child: Image.asset(
            featured.thumbnailPath,
            height: MediaQuery.of(context).size.height * 0.7,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
              height: MediaQuery.of(context).size.height * 0.5,
              color: Colors.grey.shade900,
              alignment: Alignment.center,
              child: const Icon(Icons.movie_filter, size: 80, color: Colors.white70),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  featured.category ?? '',
                  style: const TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  featured.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                if (featured.part != null)
                  Text(
                    featured.part!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      'IMDb ${featured.imdbRating ?? 'N/A'}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.live_tv, color: Colors.white70, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      featured.streamsCount ?? 'N/A Streams',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: controller.onPlayFeaturedContent,
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('Play'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.onWatchTrailerFeaturedContent,
                        icon: const Icon(Icons.info_outline),
                        label: const Text('Watch Trailer'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.video_library),
          label: 'Series',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: 'Movies',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.download),
          label: 'Downloads',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'More',
        ),
      ],
      onTap: (index) {
        print('Bottom nav tapped: $index');
      },
    );
  }
}
