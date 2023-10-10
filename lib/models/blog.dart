class Blog {
  final String title;
  final String imageUrl;
  final String? description;
  bool isFavorite;

  Blog({
    required this.title,
    required this.imageUrl,
    this.description,
    this.isFavorite = false,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      description: json['description'],
    );
  }
}
