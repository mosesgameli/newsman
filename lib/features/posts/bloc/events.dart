part of "bloc.dart";

sealed class PostsOverviewEvent extends Equatable {
  const PostsOverviewEvent();

  @override
  List<Object> get props => [];
}

final class PostsOverviewSubscriptionRequested extends PostsOverviewEvent {
  const PostsOverviewSubscriptionRequested();
}

final class SinglePostById extends PostsOverviewEvent {
  const SinglePostById(this.id);

  final int id;

  @override
  List<Object> get props => [id];
}
