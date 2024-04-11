import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/features/posts/posts.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return PostsOverview(
          postsBloc: context.read<PostsBloc>(),
        );
      },
    ),
    GoRoute(
      path: "/details",
      builder: (context, state) => const PostDetail(),
    )
  ],
);
