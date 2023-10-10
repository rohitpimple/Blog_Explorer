import 'package:blog_explorer/models/blog.dart';

class FavoriteManager {
  static final FavoriteManager _instance = FavoriteManager._internal();
  factory FavoriteManager() => _instance;
  FavoriteManager._internal();

  final Set<Blog> _favorites = {};

  bool isFavorite(Blog blog) => _favorites.contains(blog);

  void toggleFavorite(Blog blog) {
    if (_favorites.contains(blog)) {
      _favorites.remove(blog);
    } else {
      _favorites.add(blog);
    }
  }

  Set<Blog> get favorites => _favorites;
}