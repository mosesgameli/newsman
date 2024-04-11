import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsman/features/posts/bloc/bloc.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          return Center(
            child: Card(
              child: GestureDetector(
                onTap: () => context.go("/"),
                child: Text(state.currentPost!.body),
              ),
            ),
          );
        },
      ),
    );
  }
}
