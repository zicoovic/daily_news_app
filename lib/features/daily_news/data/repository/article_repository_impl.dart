import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/resources/data_state.dart';
import 'package:flutter_application_1/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_application_1/features/daily_news/data/models/article.dart';
import 'package:flutter_application_1/features/daily_news/domain/repository/article_repository.dart';

import '../../../../core/constant/constants.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);

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
}
