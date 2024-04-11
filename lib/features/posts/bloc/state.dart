part of 'bloc.dart';

enum PostsStatus { initial, loading, success, failure }

final class PostsState extends Equatable {
  const PostsState({
    this.status = PostsStatus.initial,
    this.posts = const [],
    this.currentPost,
  });

  final PostsStatus status;
  final List<PostModel> posts;
  final PostModel? currentPost;

  @override
  List<Object?> get props => [status, posts, currentPost];

  PostsState copyWith({
    PostsStatus? status,
    List<PostModel>? posts,
    PostModel? post,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      currentPost: post,
    );
  }
}
