import 'package:posts_api/posts_api.dart';

class PostsRepository {
  const PostsRepository({
    required PostsApi postsApi,
  }) : _postsApi = postsApi;

  final PostsApi _postsApi;

  Stream<List<PostModel>> getPosts() => _postsApi.getPosts();

  PostModel getPostById(int id) => _postsApi.getPostById(id);
}
