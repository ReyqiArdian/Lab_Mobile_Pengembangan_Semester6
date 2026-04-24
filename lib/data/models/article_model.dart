class Article {
  final String title;
  final String image;

  Article({required this.title, required this.image});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      image: json['urlToImage'] ?? "https://via.placeholder.com/300x200.png",
    );
  }
}
