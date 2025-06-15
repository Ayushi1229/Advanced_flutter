class Content {
  final String id;
  final String title;
  final String thumbnailPath;
  final String? category;
  final String? part;
  final String? imdbRating;
  final String? streamsCount;
  final String? fullDescription;

  Content({
    required this.id,
    required this.title,
    required this.thumbnailPath,
    this.category,
    this.part,
    this.imdbRating,
    this.streamsCount,
    this.fullDescription,
  });
}

class AppDataModel {
  late Content _featuredContent;
  late List<Content> _newThisWeek;
  late List<Content> _trendingNow;
  late List<Content> _myList;

  AppDataModel() {
    _loadDummyData();
  }

  Content get featuredContent => _featuredContent;
  List<Content> get newThisWeek => List.unmodifiable(_newThisWeek);
  List<Content> get trendingNow => List.unmodifiable(_trendingNow);
  List<Content> get myList => List.unmodifiable(_myList);

  void _loadDummyData() {
    _featuredContent = Content(
      id: 'money_heist_s4',
      title: 'Money Heist',
      category: 'Series',
      part: 'Part 4',
      imdbRating: '8.8/10',
      streamsCount: '28+ Streams',
      thumbnailPath: 'assets/Money-Heist.png',
      fullDescription:
      'A criminal mastermind who goes by "The Professor" has a plan to pull off the biggest heist in history.',
    );

    _newThisWeek = [
      Content(
        id: 'squid_game',
        title: 'Squid Game',
        thumbnailPath: 'assets/squid_game.png',
      ),
      Content(
        id: 'stranger_things',
        title: 'Stranger Things',
        thumbnailPath: 'assets/stranger_things.png',
      ),
      Content(
        id: 'alice_in_borderland',
        title: 'Alice in Borderland',
        thumbnailPath: 'assets/alice_in_borderland.png',
      ),
      Content(
        id: 'dark',
        title: 'Dark',
        thumbnailPath: 'assets/dark.png',
      ),
      Content(
        id: 'wednesday',
        title: 'Wednesday',
        thumbnailPath: 'assets/wednesday.png',
      ),
      Content(
        id: 'berlin',
        title: 'Berlin',
        thumbnailPath: 'assets/berlin.png',
      ),
    ];

    _trendingNow = [
      Content(
        id: 'trending_1',
        title: 'Trending Show 1',
        thumbnailPath: 'assets/images/trending_1.jpg',
      ),
      Content(
        id: 'trending_2',
        title: 'Trending Movie 2',
        thumbnailPath: 'assets/images/trending_2.jpg',
      ),
      Content(
        id: 'trending_3',
        title: 'Trending Series 3',
        thumbnailPath: 'assets/images/trending_3.jpg',
      ),
      Content(
        id: 'trending_4',
        title: 'Hot Hit 4',
        thumbnailPath: 'assets/images/trending_4.jpg',
      ),
      Content(
        id: 'trending_5',
        title: 'Popular Film 5',
        thumbnailPath: 'assets/images/trending_5.jpg',
      ),
    ];

    _myList = [];
  }

  void addContentToMyList(Content content) {
    if (!_myList.contains(content)) {
      _myList.add(content);
    }
  }

  void removeContentFromMyList(Content content) {
    _myList.remove(content);
  }
}
