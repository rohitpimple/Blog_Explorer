import 'package:blog_explorer/screens/favorite_manager.dart';
import 'package:flutter/material.dart';
import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/screens/detailed_blog_screen.dart';

class FavoriteBlogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Blog> favoriteBlogs = FavoriteManager().favorites.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Blogs'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: favoriteBlogs.length,
        itemBuilder: (context, index) {
          final blog = favoriteBlogs[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailedBlogScreen(blog: blog),
                      ),
                    );
                  },
                  child: Image.network(
                    blog.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailedBlogScreen(blog: blog),
                        ),
                      );
                    },
                    child: Text(
                      blog.title,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        },
      ),
    );
  }
}