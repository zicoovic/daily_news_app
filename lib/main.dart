import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/daily_news/presentation/pages/home/daily_news.dart';

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
    return const MaterialApp(
      home: DailyNews(),
    );
  }
}
