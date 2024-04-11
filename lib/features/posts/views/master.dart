import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsman/features/posts/bloc/bloc.dart';

import '../widgets/post_loading.dart';
import '../widgets/posts_error.dart';
import '../widgets/posts_list.dart';

class PostsOverview extends StatelessWidget {
  const PostsOverview({
    super.key,
    required PostsBloc postsBloc,
  }) : _postsBloc = postsBloc;

  final PostsBloc _postsBloc;

  @override
  Widget build(BuildContext context) {
    _postsBloc.add(const PostsOverviewSubscriptionRequested());

    return Scaffold(
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state.status == PostsStatus.loading) {
            return const PostsLoadingWidget();
          }

          if (state.status == PostsStatus.failure) {
            return PostsErrorWidget(
              onRetry: () {
                _postsBloc.add(const PostsOverviewSubscriptionRequested());
              },
            );
          }

          return PostsListWidget(posts: state.posts);
        },
      ),
    );
  }
}
