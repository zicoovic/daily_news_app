import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:flutter_application_1/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:flutter_application_1/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      primary: true,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
}

_buildAppBar() {
  return AppBar(
    title: const Text(
      'Daily News!',
      style: TextStyle(color: Colors.black),
    ),
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
    builder: (_, state) {
      if (state is RemoteArticleLoading) {
        return const Center(child: CupertinoActivityIndicator());
      }
      if (state is RemoteArticleError) {
        return const Center(child: Icon(Icons.refresh));
      }
      if (state is RemoteArticleDone) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index],
            );
            ;
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    },
  );
}
