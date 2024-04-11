import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:posts_api/posts_api.dart';

import '../bloc/bloc.dart';

class PostsListWidget extends StatelessWidget {
  const PostsListWidget({
    super.key,
    required this.posts,
  });

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.amber,
            ),
            child: ListTile(
              onTap: () {
                context.read<PostsBloc>().add(SinglePostById(posts[index].id));
                context.go("/details");
              },
              title: Text(
                posts[index].title,
                maxLines: 1,
                softWrap: false,
              ),
              subtitle: Text(
                posts[index].body,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }
}
