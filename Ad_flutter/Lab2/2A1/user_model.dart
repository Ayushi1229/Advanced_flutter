class User {
  final String name;
  final int rollNo;
  bool isFavorite;

  User({required this.name, required this.rollNo, this.isFavorite = false});

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }
}
