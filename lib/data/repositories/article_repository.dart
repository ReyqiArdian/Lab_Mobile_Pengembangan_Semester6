import '../models/article_model.dart';
import '../../core/services/api_service.dart';

class ArticleRepository {
  final api = ApiService();

  Future<List<Article>> getArticles() async {
    final data = await api.fetchArticles();
    return data.map((e) => Article.fromJson(e)).toList();
  }
}
