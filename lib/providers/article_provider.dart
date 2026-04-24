import 'package:flutter/material.dart';
import '../data/models/article_model.dart';
import '../data/repositories/article_repository.dart';
import '../local/cache_service.dart';

class ArticleProvider extends ChangeNotifier {
  List<Article> articles = [];
  List<Article> filteredArticles = [];

  bool isLoading = false;
  String error = "";

  final repo = ArticleRepository();
  final cache = CacheService();

  Future<void> fetchArticles() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await repo.getArticles();
      articles = data;
      filteredArticles = articles;

      await cache.saveData(
        'articles',
        data.map((e) => {'title': e.title, 'urlToImage': e.image}).toList(),
      );

      error = "";
    } catch (e) {
      final cached = await cache.getData('articles');

      if (cached != null) {
        articles = cached.map((e) => Article.fromJson(e)).toList();
        filteredArticles = articles;
        error = "Offline mode";
      } else {
        error = "Tidak ada data 😢";
      }
    }

    isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredArticles = articles;
    } else {
      filteredArticles = articles
          .where((a) => a.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
