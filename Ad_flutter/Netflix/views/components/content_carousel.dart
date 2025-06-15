// lib/views/components/content_carousel.dart
import 'package:flutter/material.dart';
import '../../controllers/home_controller.dart';
import '../../models/content_model.dart';
// import 'content_model.dart';
// import 'home_controller.dart'; // To call controller methods

class ContentCarousel extends StatelessWidget {
  final List<ContentItem> contentItems;
  final HomeController controller;

  const ContentCarousel({Key? key, required this.contentItems, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Fixed height for carousel items
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: contentItems.length,
        itemBuilder: (context, index) {
          final item = contentItems[index];
          return GestureDetector(
            onTap: () => controller.model.playContent(item.videoUrl), // Call model method to play
            child: Container(
              width: 120, // Width for each item
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.title,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}