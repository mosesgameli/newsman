import 'package:flutter/material.dart';

class PostsErrorWidget extends StatelessWidget {
  const PostsErrorWidget({
    super.key,
    required this.onRetry,
  });

  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Data could not be loaded. Please try again.",
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: onRetry,
              child: const Text("Retry"),
            )
          ],
        ),
      ),
    );
  }
}
