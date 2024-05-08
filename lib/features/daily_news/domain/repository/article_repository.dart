import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  // API method
  Future<DataState<List<ArticleEntity>>> getNewArticles();
  // DataBase methods

  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);
}
