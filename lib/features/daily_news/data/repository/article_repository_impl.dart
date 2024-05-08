import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_application_1/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_application_1/features/daily_news/data/models/article.dart';
import 'package:flutter_application_1/features/daily_news/domain/entities/article.dart';
import 'package:flutter_application_1/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constant/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewArticles() async {
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );
    try {
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() async {
    return _appDatabase.articleDAO.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO
        .insertArticle(ArticleModel.fromEntity(article));
  }
}
