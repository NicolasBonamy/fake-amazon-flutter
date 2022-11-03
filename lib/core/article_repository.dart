import 'package:fake_amazon/core/dio_client.dart';
import 'package:fake_amazon/model/article_model.dart';

class ArticleRepository {
  Future<List<Article>> getArticles() async {
    try {
      final result =
          await ApiClient().getArticles("https://fakestoreapi.com/products");
      final List data = result;
      return data.map((article) => Article.fromJson(article)).toList();
    } catch (error) {
      throw Exception(error);
    }
  }
}
