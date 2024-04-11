import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_api/posts_api.dart';
import 'package:posts_repository/posts_repository.dart';

part "events.dart";
part "state.dart";

class PostsBloc extends Bloc<PostsOverviewEvent, PostsState> {
  PostsBloc({
    required postsRepository,
  })  : _postsRepository = postsRepository,
        super(const PostsState()) {
    on<PostsOverviewSubscriptionRequested>(_onDiscoveryStarted);
    on<SinglePostById>(_onSinglePostById);
  }

  final PostsRepository _postsRepository;

  Future<void> _onDiscoveryStarted(
    PostsOverviewEvent event,
    Emitter<PostsState> emit,
  ) async {
    emit(state.copyWith(status: PostsStatus.loading));

    await Future.delayed(const Duration(seconds: 2));

    if (Random().nextBool()) {
      await emit.forEach<List<PostModel>>(
        _postsRepository.getPosts(),
        onData: (posts) => state.copyWith(
          status: PostsStatus.success,
          posts: posts,
        ),
        onError: (error, stackTrace) => state.copyWith(
          status: PostsStatus.failure,
        ),
      );
    } else {
      emit(state.copyWith(status: PostsStatus.failure));
    }
  }

  FutureOr<void> _onSinglePostById(
    SinglePostById event,
    Emitter<PostsState> emit,
  ) {
    final post = _postsRepository.getPostById(event.id);

    emit(state.copyWith(post: post));
  }
}
