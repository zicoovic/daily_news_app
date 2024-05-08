import 'package:dio/dio.dart';
import 'package:flutter_application_1/features/daily_news/data/data_sources/local/app_database.dart';
import 'package:flutter_application_1/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:flutter_application_1/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_application_1/features/daily_news/domain/repository/article_repository.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/get_article.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/get_saved_article.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/remove_article.dart';
import 'package:flutter_application_1/features/daily_news/domain/usecases/save_article.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/local/local_article_bloc.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  s1.registerSingleton<AppDatabase>(database);
//Dio

  s1.registerSingleton<Dio>(Dio());

// Dependencies

  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));

  s1.registerSingleton<ArticleRepository>(
    ArticleRepositoryImpl(s1(), s1()),
  );

//useCases

  s1.registerSingleton<GetArticleUseCase>(
    GetArticleUseCase(s1()),
  );
  s1.registerSingleton<SaveArticleUseCase>(
    SaveArticleUseCase(s1()),
  );
  s1.registerSingleton<GetSavedArticleUseCase>(
    GetSavedArticleUseCase(s1()),
  );
  s1.registerSingleton<RemoveArticleUseCase>(
    RemoveArticleUseCase(s1()),
  );
// bloc

  s1.registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(s1()));
  s1.registerFactory<LocalArticleBloc>(
    () => LocalArticleBloc(s1(), s1(), s1()),
  );
}
