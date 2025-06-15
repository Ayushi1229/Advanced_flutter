import 'package:flutter/material.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A5/app_data_model.dart';
import 'package:flutter_lab/Ad_flutter/Lab2/2A5/views/content_card.dart';

class ContentSection extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final void Function(Content) onContentTap;

  const ContentSection({
    super.key,
    required this.title,
    required this.contentList,
    required this.onContentTap,
  });

  @override
  Widget build(BuildContext context) {
    if (contentList.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title of the section (like "Trending Now" or "New this week")
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 12.0),
          // Horizontal scroll list of content cards
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              itemCount: contentList.length,
              itemBuilder: (context, index) {
                final content = contentList[index];
                return ContentCard(
                  content: content,
                  onTap: () => onContentTap(content),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
