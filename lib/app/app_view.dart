import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/features/posts/posts.dart';
import 'package:posts_repository/posts_repository.dart';

import 'app_routes.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.postsRepository,
  });

  final PostsRepository postsRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: postsRepository,
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: PostsBloc(
        postsRepository: context.read<PostsRepository>(),
      ),
      child: MaterialApp.router(
        routerConfig: appRouter,
      ),
    );
  }
}
