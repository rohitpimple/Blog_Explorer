import 'package:flutter/material.dart';
import 'package:blog_explorer/models/blog.dart';
import 'package:blog_explorer/screens/favorite_manager.dart';
import 'package:share/share.dart';

class DetailedBlogScreen extends StatefulWidget {
  final Blog blog;

  DetailedBlogScreen({required this.blog});

  @override
  _DetailedBlogScreenState createState() => _DetailedBlogScreenState();
}

class _DetailedBlogScreenState extends State<DetailedBlogScreen> {
  late FavoriteManager favoriteManager;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    favoriteManager = FavoriteManager();
    isFavorite = favoriteManager.isFavorite(widget.blog);
  }

  void toggleFavoriteState() {
    setState(() {
      isFavorite = !isFavorite;
      favoriteManager.toggleFavorite(widget.blog);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(widget.blog.imageUrl),
            const SizedBox(height: 20.0),
            Text(
              widget.blog.title,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.blog.description ?? 'No description available',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            IconButton(
              onPressed: () {
                toggleFavoriteState();
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
                size: 40.0,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                final text =
                    'Check out this blog: ${widget.blog.title}\n${widget.blog.imageUrl}';
                Share.share(text);
              },
              child: const Text('Share'),
            ),
          ],
        ),
      ),
    );
  }
}
