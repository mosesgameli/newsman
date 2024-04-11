import 'package:flutter/material.dart';

class PostsLoadingWidget extends StatelessWidget {
  const PostsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
