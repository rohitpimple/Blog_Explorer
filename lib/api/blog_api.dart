import 'package:blog_explorer/models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BlogApi {
  static const String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  static const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  static Future<List<Blog>> fetchBlogs() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'x-hasura-admin-secret': adminSecret},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> blogList = data['blogs'];
        final List<Blog> blogs = blogList
            .map((blogJson) => Blog.fromJson(blogJson))
            .toList();
        return blogs;
      } else {
        throw Exception('Failed to load blogs');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
