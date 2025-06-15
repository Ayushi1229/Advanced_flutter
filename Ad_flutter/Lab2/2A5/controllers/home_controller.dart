import 'package:flutter/material.dart';
import '../app_data_model.dart';

class HomeController extends ChangeNotifier {
  late AppDataModel _dataModel;

  HomeController({required AppDataModel appDataModel}) {
    _dataModel = appDataModel;
  }

  void updateAppDataModel(AppDataModel newModel) {
    if (_dataModel != newModel) {
      _dataModel = newModel;
      notifyListeners();
    }
  }

  Content get featuredContent => _dataModel.featuredContent;
  List<Content> get newThisWeek => _dataModel.newThisWeek;
  List<Content> get trendingNow => _dataModel.trendingNow;

  void onPlayFeaturedContent() {
    print('Playing: ${featuredContent.title}');
  }

  void onWatchTrailerFeaturedContent() {
    print('Watching trailer for: ${featuredContent.title}');
  }

  void onContentCardTap(Content content) {
    print('Tapped on content: ${content.title}');
  }

  void addContentToMyList(Content content) {
    _dataModel.addContentToMyList(content);
    notifyListeners();
    print('${content.title} added to My List.');
  }

  void removeContentFromMyList(Content content) {
    _dataModel.removeContentFromMyList(content);
    notifyListeners();
    print('${content.title} removed from My List.');
  }
}