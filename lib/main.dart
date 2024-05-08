import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/theme/app_themes.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/routes/routes.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => s1()..add(const GetArticles()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const DailyNews()),
    );
  }
}
