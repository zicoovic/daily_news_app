import 'package:flutter_application_1/features/daily_news/data/models/article.dart';

import 'package:retrofit/retrofit.dart';

import 'package:dio/dio.dart';

import '../../../../../core/constant/constants.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('/top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
    @Query("apiKey") String? apiKey,
    @Query("country") String? country,
    @Query("category") String? category,
  });
}
