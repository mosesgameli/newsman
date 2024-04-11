import 'models/post_model.dart';

abstract class PostsApi {
  const PostsApi();

  Stream<List<PostModel>> getPosts();

  PostModel getPostById(int id);
}
