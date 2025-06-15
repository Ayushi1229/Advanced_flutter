import 'package:url_launcher/url_launcher.dart';

import 'base_model.dart';

class ContentItem {
  final String id;
  final String title;
  final String imageUrl;
  final String videoUrl;

  ContentItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.videoUrl,
  });
}

class ContentListModel extends BaseModel {
  List<ContentItem> _weThinkYoullLike = [];
  List<ContentItem> _indianMovies = [];
  List<ContentItem> _onlyOnNetflix = [];
  bool _isLoadingContent = false;
  String? _contentErrorMessage;

  List<ContentItem> get weThinkYoullLike => _weThinkYoullLike;
  List<ContentItem> get indianMovies => _indianMovies;
  List<ContentItem> get onlyOnNetflix => _onlyOnNetflix;
  bool get isLoadingContent => _isLoadingContent;
  String? get contentErrorMessage => _contentErrorMessage;

  ContentListModel() {
    fetchContent();
  }

  Future<void> fetchContent() async {
    _isLoadingContent = true;
    _contentErrorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay

    _weThinkYoullLike = [
      ContentItem(id: 'wt_1', title: 'Movie A', imageUrl: 'assets/images/movie1.png', videoUrl: 'https://www.netflix.com/watch/80238401'),
      ContentItem(id: 'wt_2', title: 'Movie B', imageUrl: 'assets/images/movie2.png', videoUrl: 'https://www.netflix.com/watch/81731618'),
      ContentItem(id: 'wt_3', title: 'Movie C', imageUrl: 'assets/images/movie3.png', videoUrl: 'https://www.netflix.com/watch/81161626'),
      ContentItem(id: 'wt_4', title: 'Movie D', imageUrl: 'assets/images/movie4.png', videoUrl: 'https://www.netflix.com/watch/80233783'),
      ContentItem(id: 'wt_5', title: 'Movie E', imageUrl: 'assets/images/movie5.png', videoUrl: 'https://www.netflix.com/watch/81034895'),
      ContentItem(id: 'wt_6', title: 'Movie F', imageUrl: 'assets/images/movie6.png', videoUrl: 'https://www.netflix.com/watch/70208599'),
    ];

    _indianMovies = [
      ContentItem(id: 'im_1', title: 'Indian Movie G', imageUrl: 'assets/images/movie7.png', videoUrl: 'https://www.netflix.com/watch/81436990'),
      ContentItem(id: 'im_2', title: 'Indian Movie H', imageUrl: 'assets/images/movie8.png', videoUrl: 'https://www.netflix.com/watch/81671215'),
      ContentItem(id: 'im_3', title: 'Indian Movie I', imageUrl: 'assets/images/movie9.png', videoUrl: 'https://www.netflix.com/watch/81656709'),
      ContentItem(id: 'im_4', title: 'Indian Movie J', imageUrl: 'assets/images/movie10.png', videoUrl: 'https://www.netflix.com/watch/81639323'),
      ContentItem(id: 'im_5', title: 'Indian Movie K', imageUrl: 'assets/images/movie11.png', videoUrl: 'https://www.netflix.com/watch/70276515'),
      ContentItem(id: 'im_6', title: 'Indian Movie L', imageUrl: 'assets/images/movie12.png', videoUrl: 'https://www.netflix.com/watch/81509545'),
    ];

    _onlyOnNetflix = [
      ContentItem(id: 'oon_1', title: 'Netflix Original M', imageUrl: 'assets/images/movie13.png', videoUrl: 'https://www.netflix.com/watch/81586786'),
      ContentItem(id: 'oon_2', title: 'Netflix Original N', imageUrl: 'assets/images/movie14.png', videoUrl: 'https://www.netflix.com/watch/80077368'),
      ContentItem(id: 'oon_3', title: 'Netflix Original O', imageUrl: 'assets/images/movie15.png', videoUrl: 'https://www.netflix.com/watch/80218003'),
      ContentItem(id: 'oon_4', title: 'Netflix Original P', imageUrl: 'assets/images/movie16.png', videoUrl: 'https://www.netflix.com/watch/70196252'),
      ContentItem(id: 'oon_5', title: 'Netflix Original Q', imageUrl: 'assets/images/movie17.png', videoUrl: 'https://www.netflix.com/watch/70171896'),
      ContentItem(id: 'oon_6', title: 'Netflix Original R', imageUrl: 'assets/images/movie18.png', videoUrl: 'https://www.netflix.com/watch/81199139'),
    ];

    _isLoadingContent = false;
    notifyListeners();
  }

  /// Simulates playing content by launching a URL.
  Future<void> playContent(String videoUrl) async {
    if (await canLaunchUrl(Uri.parse(videoUrl))) {
      await launchUrl(Uri.parse(videoUrl), mode: LaunchMode.externalApplication);
    } else {
      _contentErrorMessage = 'Could not launch $videoUrl';
      notifyListeners();
    }
  }
}